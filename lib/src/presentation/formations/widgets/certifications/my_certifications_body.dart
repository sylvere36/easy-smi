import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../_commons/route/app_router.gr.dart';

class MyCertificationsBody extends StatefulWidget {
  const MyCertificationsBody({super.key});

  @override
  State<MyCertificationsBody> createState() => _MyCertificationsBodyState();
}

class _MyCertificationsBodyState extends State<MyCertificationsBody> {
  final _page = PageController(viewportFraction: .65);
  int _current = 0;

  final _cards = const [
    _CertCardData(
      title: 'Satisfaction client',
      questions: 20,
      progress: .35,
      // remplace par tes images
      image:
          'https://images.unsplash.com/photo-1614064548018-0a1f3c94d0a7?q=80&w=800&auto=format&fit=crop',
    ),
    _CertCardData(
      title: 'Management de …',
      questions: 20,
      progress: .15,
      image:
          'https://images.unsplash.com/photo-1581092795360-fd1ca04f0952?q=80&w=800&auto=format&fit=crop',
    ),
    _CertCardData(
      title: 'Expérience client',
      questions: 20,
      progress: .62,
      image:
          'https://images.unsplash.com/photo-1551836022-d5d88e9218df?q=80&w=800&auto=format&fit=crop',
    ),
  ];

  final _unfinished = List<_QuizRowData>.generate(
    4,
    (i) => const _QuizRowData(
      title: 'Orientation client  - Au coeur de la confiance',
      questions: 20,
      progress: .60,
      image:
          'https://images.unsplash.com/photo-1603575449299-b5d26f3d46f2?q=80&w=600&auto=format&fit=crop',
    ),
  );

  @override
  void initState() {
    super.initState();
    _page.addListener(() {
      final idx = (_page.page ?? 0).round();
      if (idx != _current) setState(() => _current = idx);
    });
  }

  @override
  void dispose() {
    _page.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final h1 = GoogleFonts.montserrat(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: const Color(0xFF101828),
    );
    final body = GoogleFonts.inter(
      fontSize: 12,
      color: const Color(0xFF667085),
      fontWeight: FontWeight.w600,
    );

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      children: [
        // Bonjour + badge
        _GreetingRow(name: 'Jean', total: 5, onTapBadge: () {}),

        // Titre + Voir plus
        Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 8),
          child: Column(
            children: [
              Text(
                "Quelle certifiaction aimerais tu passé aujourd'hui ?",
                style: h1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      context.router.push(const AllCertificationsRoute());
                    },
                    child: Text(
                      'Voir plus',
                      style: GoogleFonts.inter(
                        color: const Color(0xFF246BFD),
                        fontSize: 13.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // Carrousel
        SizedBox(
          height: 220,
          child: PageView.builder(
            controller: _page,
            itemCount: _cards.length,
            padEnds: false,
            itemBuilder: (ctx, i) => Padding(
              padding: EdgeInsets.only(right: i == _cards.length - 1 ? 0 : 14),
              child: _CertificationCard(data: _cards[i]),
            ),
          ),
        ),

        // Indicators (petits segments)
        Padding(
          padding: const EdgeInsets.only(top: 8, left: 4),
          child: Row(
            children: List.generate(
              _cards.length,
              (i) => Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Container(
                  width: i == _current ? 28 : 10,
                  height: 4,
                  decoration: BoxDecoration(
                    color: i == _current
                        ? const Color(0xFF7C8CF7)
                        : const Color(0xFFD9DBE9),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
            ),
          ),
        ),

        // Section “Quizz inachevés”
        Padding(
          padding: const EdgeInsets.only(top: 18, bottom: 8),
          child: Text(
            'Quizz inachevés',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF101828),
            ),
          ),
        ),

        // Rows
        for (final row in _unfinished)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _QuizRow(data: row, subtitleStyle: body),
          ),
      ],
    );
  }
}

/* ------------------------------------------------------------- */
/* Widgets                                                        */
/* ------------------------------------------------------------- */

class _GreetingRow extends StatelessWidget {
  const _GreetingRow({
    required this.name,
    required this.total,
    required this.onTapBadge,
  });

  final String name;
  final int total;
  final VoidCallback onTapBadge;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'Bonjour $name',
            style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 14),
          ),
        ),
        InkWell(
          onTap: onTapBadge,
          borderRadius: BorderRadius.circular(18),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF0F67FE),
              borderRadius: BorderRadius.circular(18),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x220F67FE),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Text(
                  total.toString().padLeft(2, '0'),
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
                Text(
                  ' Certifications',
                  style: GoogleFonts.inter(
                    color: Colors.white.withValues(alpha: .9),
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _CertificationCard extends StatelessWidget {
  const _CertificationCard({required this.data});

  final _CertCardData data;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE4E7EC)),
        ),
        padding: const EdgeInsets.all(12).copyWith(bottom: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: AspectRatio(
                aspectRatio: 1.45,
                child: Assets.images.quizz.image(fit: BoxFit.cover),
              ),
            ),
            // title
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                data.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.montserrat(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF101828),
                ),
              ),
            ),
            // subtitle + tiny progress bar
            Row(
              children: [
                Text(
                  '${data.questions} Questions',
                  style: GoogleFonts.inter(
                    fontSize: 12.5,
                    color: const Color(0xFF7A7F8C),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: 90,
                  height: 4,
                  child: ClipRRect(
                    child: LinearProgressIndicator(
                      borderRadius: BorderRadius.circular(8),
                      value: data.progress,
                      backgroundColor: const Color(0xFFE7EAF3),
                      valueColor: const AlwaysStoppedAnimation(
                        Color(0xFF7C8CF7),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _QuizRow extends StatelessWidget {
  const _QuizRow({required this.data, required this.subtitleStyle});

  final _QuizRowData data;
  final TextStyle subtitleStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE4E7EC)),
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Leading image (rounded)
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(10),
          //   child: Image.network(
          //     data.image,
          //     width: 42,
          //     height: 42,
          //     fit: BoxFit.cover,
          //   ),
          // ),
          Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              color: const Color(0xFFF9FAFB),
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: Assets.images.quizz.image(width: 62, height: 62),
          ),

          // Title + subtitle
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF101828),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      '${data.questions} Questions',
                      style: subtitleStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Circular progress with text
          _RingProgress(percent: (data.progress * 100).round()),
        ],
      ),
    );
  }
}

class _RingProgress extends StatelessWidget {
  const _RingProgress({required this.percent});
  final int percent;

  @override
  Widget build(BuildContext context) {
    const double size = 38;
    final value = percent / 100;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            value: value,
            strokeWidth: 4,

            backgroundColor: const Color(0xFFE7EAF3),
            valueColor: const AlwaysStoppedAnimation(Color(0xFF2E6CF6)),
          ),
          Text(
            '$percent%',
            style: GoogleFonts.inter(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF2E6CF6),
            ),
          ),
        ],
      ),
    );
  }
}

/* ------------------------------------------------------------- */
/* Data classes                                                   */
/* ------------------------------------------------------------- */

class _CertCardData {
  final String title;
  final int questions;
  final double progress;
  final String image;
  const _CertCardData({
    required this.title,
    required this.questions,
    required this.progress,
    required this.image,
  });
}

class _QuizRowData {
  final String title;
  final int questions;
  final double progress;
  final String image;
  const _QuizRowData({
    required this.title,
    required this.questions,
    required this.progress,
    required this.image,
  });
}
