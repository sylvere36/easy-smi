import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../gen/assets.gen.dart';
import '../../_commons/route/app_router.gr.dart';
import '../../_commons_widgets/network_video_viewer.dart';

class SensibilisationDetailBody extends StatefulWidget {
  const SensibilisationDetailBody({super.key});

  @override
  State<SensibilisationDetailBody> createState() =>
      _SensibilisationDetailBodyState();
}

enum MediaType { video, quiz, pdf }

class _SensibilisationDetailBodyState extends State<SensibilisationDetailBody> {
  // --- Fake data -------------------------------------------------------------
  final _comments = List.generate(
    2,
    (i) => const (
      author: 'Beatrice BOSSOU',
      when: 'Il y a 30 min',
      text:
          'Les documents fournies ne respectent par les normes internationnales',
      avatarInitials: 'MH',
    ),
  );

  // 3 médias (comme dans tes screens) : vidéo, quiz, pdf
  final List<_Media> _medias = const [
    _Media(
      type: MediaType.video,
      cover:
          'https://images.unsplash.com/photo-1573167243872-43c6433b9d40?q=80&w=1200&auto=format&fit=crop',
      videoUrl:
          'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    ),
    _Media(
      type: MediaType.quiz,
      cover:
          'https://raw.githubusercontent.com/horizon-ui/icons/main/assets/question-blob.png',
    ),
    _Media(
      type: MediaType.pdf,
      cover:
          'https://raw.githubusercontent.com/horizon-ui/icons/main/assets/pdf-red.png',
    ),
  ];

  int _selected = 0;
  int _views = 99;
  bool _liked = false;
  bool _saved = false;

  final _commentCtrl = TextEditingController();

  // --- UI helpers ------------------------------------------------------------
  TextStyle get _title => GoogleFonts.inter(
    fontSize: 20,
    height: 1.15,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.3,
    color: Colors.black,
  );

  @override
  void initState() {
    super.initState();
    // Simule une vue
    _views++;
  }

  @override
  void dispose() {
    _commentCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final media = _medias[_selected];
    final pad = MediaQuery.of(context).size.width * .04;

    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ----------- Title -------------
            Padding(
              padding: EdgeInsets.fromLTRB(pad, 8, pad, 12),
              child: Text(
                _selected == 0
                    ? 'Campagne de salubrité sur le PAC DE DO-PERSONNEL PAC'
                    : 'QUIIZ DE FORMATIONS SUR L’IMPORTANCE DE IA GESTION',
                style: _title,
              ),
            ),

            // ----------- Media card ----------
            Padding(
              padding: EdgeInsets.symmetric(horizontal: pad),
              child: _MediaCard(
                media: media,
                onPlayVideo: () => _openVideo(context, media.videoUrl!),
                onStartQuiz: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Démarrer le quiz…')),
                  );
                },
              ),
            ),

            // ----------- actions row ---------
            Padding(
              padding: EdgeInsets.fromLTRB(pad, 10, pad, 8),
              child: Row(
                children: [
                  _IconStat(
                    icon: Icons.remove_red_eye_outlined,
                    label: '$_views Vue',
                  ),
                  const SizedBox(width: 18),
                  GestureDetector(
                    onTap: () => setState(() => _liked = !_liked),
                    child: _IconStat(
                      icon: _liked ? Icons.thumb_up : Icons.thumb_up_outlined,
                      label: 'Reception',
                      active: _liked,
                    ),
                  ),
                  const SizedBox(width: 18),
                  GestureDetector(
                    onTap: () => setState(() => _saved = !_saved),
                    child: _IconStat(
                      icon: _saved
                          ? Icons.access_time_filled
                          : Icons.access_time,
                      label: 'Plus tard',
                      active: _saved,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.ios_share),
                    onPressed: () {
                      // Simple feedback de partage
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Lien copié dans le presse-papiers'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            // ----------- thumbnails ----------
            Padding(
              padding: EdgeInsets.fromLTRB(pad, 2, pad, 0),
              child: Row(
                children: List.generate(_medias.length, (i) {
                  final m = _medias[i];
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: i == 2 ? 0 : 12),
                      child: GestureDetector(
                        onTap: () => setState(() => _selected = i),
                        child: _ThumbTile(media: m, isActive: i == _selected),
                      ),
                    ),
                  );
                }),
              ),
            ),

            // ----------- Info  ---------------
            Padding(
              padding: EdgeInsets.fromLTRB(pad, 18, pad, 8),
              child: Text(
                'Information',
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: pad),
              child: const _ExpandableText(
                text:
                    'La formation est aujourd’hui l’un des petits business les plus accessibles et rentables, surtout dans les zones rurales et semi-urbaines. '
                    'Il ne nécessite pas de diplôme spécifique ni de gros investissements au départ. En quelques semaines, il est possible de générer des revenus réels…',
              ),
            ),

            // ----------- Comment field -------
            Padding(
              padding: EdgeInsets.fromLTRB(pad, 16, pad, 0),
              child: _CommentField(
                controller: _commentCtrl,
                onSend: () {
                  if (_commentCtrl.text.trim().isEmpty) return;
                  setState(() {
                    _comments.insert(0, (
                      author: 'Moi',
                      when: 'à l’instant',
                      text: _commentCtrl.text.trim(),
                      avatarInitials: 'ME',
                    ));
                    _commentCtrl.clear();
                  });
                },
              ),
            ),

            // ----------- Comments header -----
            Padding(
              padding: EdgeInsets.fromLTRB(pad, 16, pad, 8),
              child: Row(
                children: [
                  Text(
                    'Commentaire(s)',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(width: 8),
                  _CountPill(count: _comments.length),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      context.router.push(const CommentsRoute());
                    },
                    child: Text(
                      'Voir tout',
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ----------- Comments list -------
            Padding(
              padding: EdgeInsets.symmetric(horizontal: pad),
              child: Column(
                children: _comments
                    .map(
                      (c) => _CommentTile(
                        name: c.author,
                        when: c.when,
                        text: c.text,
                        initials: c.avatarInitials,
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------- Video BottomSheet ---------------------------------------------
  Future<void> _openVideo(BuildContext context, String url) async {
    await showNetworkVideoViewer(context, url: url);
  }
}

// ============================================================================
// Widgets
// ============================================================================

class _MediaCard extends StatelessWidget {
  const _MediaCard({required this.media, this.onPlayVideo, this.onStartQuiz});

  final _Media media;
  final VoidCallback? onPlayVideo;
  final VoidCallback? onStartQuiz;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(20);
    return ClipRRect(
      borderRadius: radius,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: radius,
        ),
        height: 260,
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (media.type == MediaType.video)
              Image.network(media.cover, fit: BoxFit.cover),
            if (media.type == MediaType.quiz)
              Align(
                alignment: Alignment.centerLeft,
                child: Assets.images.quizz.image(width: 220),
              ),
            if (media.type == MediaType.pdf)
              const Icon(
                Icons.picture_as_pdf_rounded,
                size: 100,
                color: Colors.red,
              ),

            if (media.type == MediaType.video)
              Center(
                child: InkWell(
                  onTap: onPlayVideo,
                  child: Container(
                    width: 76,
                    height: 76,
                    decoration: const BoxDecoration(
                      color: Colors.white70,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.play_arrow_rounded,
                      size: 44,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            if (media.type == MediaType.quiz)
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: SizedBox(
                    width: 160,
                    child: ElevatedButton.icon(
                      onPressed: onStartQuiz,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade300,
                        foregroundColor: Colors.black87,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 12,
                        ),
                      ),
                      icon: const Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                      label: Text(
                        'Demarrer',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _IconStat extends StatelessWidget {
  const _IconStat({
    required this.icon,
    required this.label,
    this.active = false,
  });

  final IconData icon;
  final String label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final c = active ? const Color(0xFF2E6CF6) : Colors.black54;
    return Row(
      children: [
        Icon(icon, size: 20, color: c),
        const SizedBox(width: 6),
        Text(
          label,
          style: GoogleFonts.inter(fontWeight: FontWeight.w600, color: c),
        ),
      ],
    );
  }
}

class _ThumbTile extends StatelessWidget {
  const _ThumbTile({required this.media, required this.isActive});
  final _Media media;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(14);
    return Container(
      height: 120,
      decoration: BoxDecoration(
        borderRadius: radius,
        boxShadow: [
          if (isActive)
            BoxShadow(
              color: const Color(0xFF2E6CF6).withOpacity(.25),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
        ],
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: radius,
              child: media.type == MediaType.quiz
                  ? Assets.images.quizz.image()
                  : (media.type == MediaType.pdf)
                  ? const Icon(
                      Icons.picture_as_pdf_rounded,
                      color: Colors.red,
                      size: 50,
                    )
                  : Image.network(media.cover, fit: BoxFit.cover),
            ),
          ),
          if (isActive)
            Positioned(
              left: 18,
              right: 18,
              bottom: 8,
              child: Container(
                height: 6,
                decoration: BoxDecoration(
                  color: const Color(0xFF2E6CF6),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _ExpandableText extends StatefulWidget {
  const _ExpandableText({required this.text});
  final String text;

  @override
  State<_ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<_ExpandableText> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final base = GoogleFonts.inter(fontSize: 16, height: 1.45);
    final text =
        widget.text * 2; // juste pour faire un pavé défilant proche du screen
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedCrossFade(
          firstChild: Text(
            text,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: base,
          ),
          secondChild: Text(text, style: base),
          crossFadeState: _expanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 200),
        ),
        const SizedBox(height: 6),
        GestureDetector(
          onTap: () => setState(() => _expanded = !_expanded),
          child: Text(
            _expanded ? 'Réduire' : 'Lire la suite',
            style: GoogleFonts.inter(
              color: const Color(0xFF2E6CF6),
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }
}

class _CommentField extends StatelessWidget {
  const _CommentField({required this.controller, required this.onSend});
  final TextEditingController controller;
  final VoidCallback onSend;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      minLines: 1,
      maxLines: 4,
      decoration: InputDecoration(
        hintText: 'Ecrire  un commentaire',
        hintStyle: GoogleFonts.inter(color: Colors.black38),
        filled: true,
        fillColor: Colors.grey.shade100,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.attach_file_rounded, color: Colors.black54),
            const SizedBox(width: 8),
            IconButton(icon: const Icon(Icons.send_rounded), onPressed: onSend),
          ],
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class _CountPill extends StatelessWidget {
  const _CountPill({required this.count});
  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.06),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        count.toString().padLeft(1, '0'),
        style: GoogleFonts.inter(fontWeight: FontWeight.w800),
      ),
    );
  }
}

class _CommentTile extends StatelessWidget {
  const _CommentTile({
    required this.name,
    required this.when,
    required this.text,
    required this.initials,
  });

  final String name;
  final String when;
  final String text;
  final String initials;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: const Color(0xFF1AA67A),
            child: Text(
              initials,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Text(
                      when,
                      style: GoogleFonts.inter(
                        color: Colors.black38,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(text, style: GoogleFonts.inter(height: 1.35)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Media {
  final MediaType type;
  final String cover;
  final String? videoUrl;
  const _Media({required this.type, required this.cover, this.videoUrl});
}
