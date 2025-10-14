import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../infrastructure/_commons/network/user_session.dart';
import '../_commons/theming/app_color.dart';

class _VideoSheet extends StatefulWidget {
  const _VideoSheet({
    required this.url,
    this.hasBtn = false, // Added optional button parameters
    this.btnTitle, // Added optional button parameters
    this.onPressed, // Added optional button parameters
  });
  final String url;
  final bool hasBtn;
  final String? btnTitle;
  final VoidCallback? onPressed;

  @override
  State<_VideoSheet> createState() => _VideoSheetState();
}

class _VideoSheetState extends State<_VideoSheet> {
  VideoPlayerController? _c;
  YoutubePlayerController? _yt;
  bool _ready = false;
  bool _showControls = true;
  Timer? _autoHide;
  String? _errorMessage;
  bool _isYouTube = false;

  bool hideBoutton = false;

  @override
  void initState() {
    super.initState();
    _isYouTube = _isYouTubeUrl(widget.url);
    _init();
  }

  Future<void> _init() async {
    log(widget.url);
    try {
      // If it's a YouTube URL, initialize the YouTube iframe player inline.
      if (_isYouTube) {
        final videoId = _extractYouTubeId(widget.url);
        if (videoId == null || videoId.isEmpty) {
          setState(() {
            _errorMessage = 'Lien YouTube invalide ou non pris en charge.';
          });
          return;
        }
        _yt = YoutubePlayerController.fromVideoId(
          videoId: videoId,
          autoPlay: true,
          params: const YoutubePlayerParams(showFullscreenButton: true),
        );
        // Mark as ready for UI purposes (YouTube widget manages its own state)
        setState(() {
          _ready = true;
          _errorMessage = null;
        });
        return;
      }

      // Build headers (auth + browser-like UA improves CDN compatibility)
      final Map<String, String> headers = {};
      try {
        final userSession = myUserSession;
        final token = await userSession.getAuthToken();
        if (token != null && token.isNotEmpty) {
          headers['Authorization'] = 'Bearer $token';
        }
      } catch (_) {}

      // Add a realistic User-Agent and Accept to bypass restrictive CDNs/origins
      String userAgent;
      switch (defaultTargetPlatform) {
        case TargetPlatform.iOS:
          userAgent =
              'Mozilla/5.0 (iPhone; CPU iPhone OS 16_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.0 Mobile/15E148 Safari/604.1';
          break;
        case TargetPlatform.android:
          userAgent =
              'Mozilla/5.0 (Linux; Android 12; Mobile) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36';
          break;
        default:
          userAgent =
              'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36';
      }
      headers['User-Agent'] = userAgent;
      headers['Accept'] = 'video/*;q=0.9,*/*;q=0.8';

      _c = VideoPlayerController.networkUrl(
        Uri.parse(widget.url),
        httpHeaders: headers,
      );

      await _c!.initialize();
      _c!.addListener(() => setState(() {}));
      setState(() => _ready = true);
      _c!.play();
      _kickAutoHide();
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _ready = false;
      });
    }
  }

  bool _isYouTubeUrl(String url) {
    final u = url.toLowerCase();
    return u.contains('youtube.com/watch') ||
        u.contains('youtu.be/') ||
        u.contains('youtube.com/embed') ||
        u.contains('youtube.com/shorts');
  }

  String? _extractYouTubeId(String url) {
    try {
      final uri = Uri.parse(url);
      final host = uri.host.toLowerCase();
      if (host.contains('youtu.be')) {
        final p = uri.pathSegments;
        if (p.isNotEmpty) return p.first;
      }
      if (host.contains('youtube.com')) {
        if (uri.path.startsWith('/watch')) {
          return uri.queryParameters['v'];
        }
        final p = uri.pathSegments;
        if (p.isNotEmpty) {
          if (p.first == 'embed' && p.length >= 2) return p[1];
          if (p.first == 'shorts' && p.length >= 2) return p[1];
        }
      }
    } catch (_) {}
    return null;
  }

  @override
  void dispose() {
    _autoHide?.cancel();
    _c?.dispose();
    _yt?.close();
    super.dispose();
  }

  void _togglePlay() {
    if (!_ready || _c == null) return;
    if (_c!.value.isPlaying) {
      _c!.pause();
    } else {
      _c!.play();
      _kickAutoHide();
    }
    setState(() {});
  }

  void _seekBy(Duration delta) {
    if (!_ready || _c == null) return;
    final pos = _c!.value.position + delta;
    _c!.seekTo(pos /* .clamp(Duration.zero, _c.value.duration) */);
    _kickAutoHide();
  }

  void _kickAutoHide() {
    _autoHide?.cancel();
    _autoHide = Timer(const Duration(seconds: 3), () {
      if (mounted && (_c?.value.isPlaying ?? false)) {
        setState(() => _showControls = false);
      }
    });
    setState(() => _showControls = true);
  }

  String _fmt(Duration d) {
    String two(int n) => n.toString().padLeft(2, '0');
    final h = d.inHours;
    final m = d.inMinutes.remainder(60);
    final s = d.inSeconds.remainder(60);
    return h > 0 ? '${two(h)}:${two(m)}:${two(s)}' : '${two(m)}:${two(s)}';
  }

  @override
  Widget build(BuildContext context) {
    final duration = (_ready && _c != null)
        ? _c!.value.duration
        : Duration.zero;
    final position = (_ready && _c != null)
        ? _c!.value.position
        : Duration.zero;

    return SafeArea(
      top: false,
      child: GestureDetector(
        onTap: _kickAutoHide,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              // barre de poignée + back
              Padding(
                padding: const EdgeInsets.only(top: 35, bottom: 8),
                child: Row(
                  children: [
                    const SizedBox(width: 8),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: 44,
                      height: 4,
                      margin: const EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(999),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),

              // lecteur avec coins arrondis
              Padding(
                padding: EdgeInsets.zero,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: AspectRatio(
                    aspectRatio: _isYouTube
                        ? 16 / 9
                        : (_ready && _c != null
                              ? _c!.value.aspectRatio
                              : 16 / 9),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // vidéo
                        const Positioned.fill(
                          child: ColoredBox(color: Colors.black),
                        ),
                        if (_isYouTube) ...[
                          if (_yt != null) const SizedBox.shrink(),
                        ] else ...[
                          if (_ready && _c != null)
                            Positioned.fill(child: VideoPlayer(_c!)),
                        ],
                        if (_isYouTube && _yt != null)
                          Positioned.fill(
                            child: YoutubePlayer(controller: _yt!),
                          ),

                        // Bouton fallback: ouvrir dans YouTube/app navigateur
                        if (_isYouTube)
                          Positioned(
                            top: 8,
                            right: 8,
                            child: IconButton.filled(
                              onPressed: () async {
                                // Ouvre l'URL originale (watch/shorts/...) dans l'app YouTube si possible
                                final uri = Uri.tryParse(widget.url);
                                if (uri != null) {
                                  await launchUrl(
                                    uri,
                                    mode: LaunchMode.externalApplication,
                                  );
                                }
                              },
                              icon: const Icon(
                                Icons.open_in_new_rounded,
                                size: 20,
                                color: Colors.white,
                              ),
                              style: IconButton.styleFrom(
                                backgroundColor: Colors.black45,
                                foregroundColor: Colors.white,
                              ),
                              tooltip: 'Ouvrir dans YouTube',
                            ),
                          ),

                        // error overlay
                        if (_errorMessage != null)
                          Positioned.fill(
                            child: Container(
                              color: Colors.black54,
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.error_outline,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                  const SizedBox(height: 12),
                                  const Text(
                                    'Impossible de lire la vidéo.\nVérifiez la configuration du serveur (Content-Length / Range) ou essayez un autre format (HLS).',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    _errorMessage!,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FilledButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text('Fermer'),
                                      ),
                                      const SizedBox(width: 12),
                                      OutlinedButton.icon(
                                        onPressed: () async {
                                          final uri = Uri.tryParse(widget.url);
                                          if (uri != null) {
                                            await launchUrl(
                                              uri,
                                              mode: LaunchMode
                                                  .externalApplication,
                                            );
                                          }
                                        },
                                        style: OutlinedButton.styleFrom(
                                          foregroundColor: Colors.white,
                                          side: const BorderSide(
                                            color: Colors.white24,
                                          ),
                                        ),
                                        icon: const Icon(
                                          Icons.open_in_new_rounded,
                                          color: Colors.white,
                                        ),
                                        label: const Text(
                                          'Ouvrir dans le navigateur',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),

                        // overlay contrôles
                        if (!_isYouTube && _showControls)
                          Positioned.fill(
                            child: Container(
                              color: Colors.black45,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  _roundIcon(
                                    icon: Icons.replay_10_rounded,
                                    // label: '15',
                                    onTap: () =>
                                        _seekBy(const Duration(seconds: -10)),
                                  ),
                                  _playButton(
                                    playing:
                                        _ready &&
                                        (_c?.value.isPlaying ?? false),
                                    onTap: _togglePlay,
                                  ),
                                  _roundIcon(
                                    icon: Icons.forward_10_rounded,
                                    // label: '15',
                                    onTap: () =>
                                        _seekBy(const Duration(seconds: 10)),
                                  ),
                                ],
                              ),
                            ),
                          ),

                        // buffering indicateur
                        if (!_isYouTube &&
                            _ready &&
                            _c != null &&
                            _c!.value.isBuffering)
                          const Center(
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),

              // Slider + timings (hidden for YouTube)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    if (!_isYouTube)
                      Text(
                        _fmt(position),
                        style: const TextStyle(color: Colors.white70),
                      ),
                    Expanded(
                      child: _isYouTube
                          ? const SizedBox.shrink()
                          : SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                activeTrackColor: Colors.white,
                                inactiveTrackColor: Colors.white24,
                                thumbColor: Colors.white,
                                overlayColor: Colors.white24,
                                trackHeight: 3,
                              ),
                              child: Slider(
                                max: (_ready ? duration.inMilliseconds : 1)
                                    .toDouble()
                                    .clamp(1.0, double.infinity),
                                value: (_ready ? position.inMilliseconds : 0)
                                    .toDouble()
                                    .clamp(
                                      0.0,
                                      (_ready ? duration.inMilliseconds : 1)
                                          .toDouble(),
                                    ),
                                onChanged: !_ready
                                    ? null
                                    : _c == null
                                    ? null
                                    : (v) {
                                        _c!.seekTo(
                                          Duration(milliseconds: v.toInt()),
                                        );
                                        _kickAutoHide();
                                      },
                              ),
                            ),
                    ),
                    if (!_isYouTube)
                      Text(
                        _fmt(duration),
                        style: const TextStyle(color: Colors.white70),
                      ),
                  ],
                ),
              ),
              if (widget.hasBtn && !hideBoutton)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: widget.onPressed != null
                          ? () {
                              widget.onPressed!();
                              setState(() {
                                hideBoutton = true;
                              });
                            }
                          : () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.primary,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        surfaceTintColor: AppColors.primary,
                      ),
                      child: Text(
                        widget.btnTitle ?? 'Continuer',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  // Widgets de contrôle
  Widget _playButton({required bool playing, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(40),
      child: Container(
        width: 76,
        height: 76,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: .85),
          shape: BoxShape.circle,
        ),
        child: Icon(
          playing ? Icons.pause_rounded : Icons.play_arrow_rounded,
          size: 44,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _roundIcon({
    required IconData icon,
    String? label,
    required VoidCallback onTap,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(32),
          child: Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: .85),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.black87, size: 30),
          ),
        ),
        if (label != null) ...[
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ],
    );
  }
}

Future<void> showNetworkVideoViewer(
  BuildContext context, {
  String url =
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
  bool hasBtn = false,
  String? btnTitle,
  VoidCallback? onPressed,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.black,
    barrierColor: Colors.black87,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (_) => _VideoSheet(
      url: url,
      hasBtn: hasBtn,
      btnTitle: btnTitle,
      onPressed: onPressed,
    ),
  );
}
