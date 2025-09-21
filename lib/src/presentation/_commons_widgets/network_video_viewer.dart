import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class _VideoSheet extends StatefulWidget {
  const _VideoSheet({required this.url});
  final String url;

  @override
  State<_VideoSheet> createState() => _VideoSheetState();
}

class _VideoSheetState extends State<_VideoSheet> {
  late final VideoPlayerController _c = VideoPlayerController.networkUrl(
    Uri.parse(widget.url),
  );
  bool _ready = false;
  bool _showControls = true;
  Timer? _autoHide;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    await _c.initialize();
    _c.addListener(() => setState(() {}));
    setState(() => _ready = true);
    _c.play();
    _kickAutoHide();
  }

  @override
  void dispose() {
    _autoHide?.cancel();
    _c.dispose();
    super.dispose();
  }

  void _togglePlay() {
    if (!_ready) return;
    if (_c.value.isPlaying) {
      _c.pause();
    } else {
      _c.play();
      _kickAutoHide();
    }
    setState(() {});
  }

  void _seekBy(Duration delta) {
    if (!_ready) return;
    final pos = _c.value.position + delta;
    _c.seekTo(pos /* .clamp(Duration.zero, _c.value.duration) */);
    _kickAutoHide();
  }

  void _kickAutoHide() {
    _autoHide?.cancel();
    _autoHide = Timer(const Duration(seconds: 3), () {
      if (mounted && _c.value.isPlaying) {
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
    final duration = _c.value.duration;
    final position = _c.value.position;

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
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: AspectRatio(
                    aspectRatio: _ready ? _c.value.aspectRatio : 16 / 9,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // vidéo
                        Container(color: Colors.black),
                        if (_ready) VideoPlayer(_c),

                        // overlay contrôles
                        if (_showControls)
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
                                    playing: _c.value.isPlaying,
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
                        if (_ready && _c.value.isBuffering)
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

              // Slider + timings
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    Text(
                      _fmt(position),
                      style: const TextStyle(color: Colors.white70),
                    ),
                    Expanded(
                      child: SliderTheme(
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
                              : (v) {
                                  _c.seekTo(Duration(milliseconds: v.toInt()));
                                  _kickAutoHide();
                                },
                        ),
                      ),
                    ),
                    Text(
                      _fmt(duration),
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ],
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
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.black,
    barrierColor: Colors.black87,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (_) => _VideoSheet(url: url),
  );
}
