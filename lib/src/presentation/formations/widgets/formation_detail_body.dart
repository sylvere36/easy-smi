import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../_commons/route/app_router.gr.dart';

class CourseBody extends StatefulWidget {
  const CourseBody({super.key});

  @override
  State<CourseBody> createState() => _CourseBodyState();
}

class _CourseBodyState extends State<CourseBody> {
  bool readMore = false;

  // --- Fake data ---
  final List<String> learnings = const [
    'Comprendre les différences entre poulets de chair et poules pondeuses',
    'Concevoir un poulailler fonctionnel et économique',
    'Gérer l’alimentation et l’hygiène de vos volailles',
    'Prévenir les maladies et assurer un bon taux de survie',
  ];

  final List<_Lesson> lessons = const [
    _Lesson('Introduction', 'Vidéo - 03:57 minutes'),
    _Lesson(
      'Pourquoi l’élevage est une bonne opportunité',
      'Vidéo - 03:57 minutes',
    ),
    _Lesson(
      'Pourquoi l’élevage est une bonne opportunité',
      'Vidéo - 03:57 minutes',
    ),
    _Lesson(
      'Pourquoi l’élevage est une bonne opportunité',
      'Vidéo - 03:57 minutes',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final titleStyle = GoogleFonts.poppins(
      fontSize: 22,
      fontWeight: FontWeight.w800,
      color: Colors.black,
      height: 1.2,
    );
    final text = GoogleFonts.poppins(
      fontSize: 15,
      color: Colors.black87,
      height: 1.45,
    );

    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header image + Play
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.network(
                      'https://images.unsplash.com/photo-1518779578993-ec3579fee39f?q=80&w=1400&auto=format&fit=crop',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    width: 76,
                    height: 76,
                    decoration: const BoxDecoration(
                      color: Colors.black45,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.play_arrow_rounded,
                      size: 48,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Introduction aux systemes de management Intégré',
              style: titleStyle,
            ),
          ),

          // Description + Lire la suite
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  readMore
                      ? 'Cette formation introduit les concepts clés des systèmes de management intégrés, qui regroupent plusieurs normes............'
                      : 'Cette formation introduit les concepts clés des systèmes de management intégrés, qui regroupent plusieurs normes .',
                  style: text,
                ),
                TextButton(
                  onPressed: () => setState(() => readMore = !readMore),
                  child: Text(
                    readMore ? 'Lire moins' : 'Lire la suite',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF0B65E3),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Metrics
          const _MetricRow(
            leading: Icons.groups_rounded,
            label: '296 déjà Inscrits',
          ),
          const _MetricRow(
            leading: Icons.person_outline,
            label: 'Formateur',
            value: 'Maxime Abou BAKARI',
          ),
          const _MetricRow(
            leading: Icons.verified_outlined,
            label: 'Certificat',
            value: 'Oui',
          ),
          const _MetricRow(
            leading: Icons.public_outlined,
            label: 'Type',
            value: 'Presentiel + Ligne',
          ),

          // CTA
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 10),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1663D6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  context.router.push(const FormationDisplayRoute());
                },
                child: Text(
                  'COMMENCER',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    letterSpacing: .5,
                  ),
                ),
              ),
            ),
          ),

          // Ce que vous apprendrez
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 8),
            child: Text(
              'Ce que vous apprendrez',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            ),
          ),
          ...learnings.map((e) => _Bullet(text: e)),

          // Programme header line
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 18, 16, 6),
            child: Text(
              'Programme',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 6),
            child: Text(
              '04 sections • 15 sessions • Durée totale: 23 h 18 min',
              style: GoogleFonts.poppins(
                color: Colors.black87.withValues(alpha: .7),
              ),
            ),
          ),

          // Section 1 (ouverte)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: _SectionHeader(
              title: 'Section 1 - INTRODUCTION A L’ELEVAGE DES VOLAILLES',
              initExpand: true,
              body: Column(
                children: List.generate(
                  lessons.length,
                  (i) => _LessonTile(index: i + 1, lesson: lessons[i]),
                ),
              ),
            ),
          ),

          // Other sections (fermées)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 10),
            child: _SectionHeader(
              title: 'Section 2   PREPARER SON ESPACE D’ELEVAGE',
              body: Column(
                children: List.generate(
                  lessons.length,
                  (i) => _LessonTile(index: i + 1, lesson: lessons[i]),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
            child: _SectionHeader(
              title: 'Section 3   ALIMENTATION ET SOIN DES VOLAILLES',
              body: Column(
                children: List.generate(
                  lessons.length,
                  (i) => _LessonTile(index: i + 1, lesson: lessons[i]),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: _SectionHeader(
              title: 'Section 4   HYGIENE , SANTE  ET VACCINATION',
              body: Column(
                children: List.generate(
                  lessons.length,
                  (i) => _LessonTile(index: i + 1, lesson: lessons[i]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// ---- Small pieces ----

class _MetricRow extends StatelessWidget {
  final IconData leading;
  final String label;
  final String? value;
  const _MetricRow({required this.leading, required this.label, this.value});

  @override
  Widget build(BuildContext context) {
    final grey = Colors.black87.withValues(alpha: .7);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 6, 16, 6),
      child: Row(
        children: [
          Icon(leading, size: 22, color: grey),
          const SizedBox(width: 10),
          Text(
            label,
            style: GoogleFonts.poppins(
              color: grey,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (value != null) ...[
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                value!,
                style: GoogleFonts.poppins(color: Colors.black87),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _Bullet extends StatelessWidget {
  final String text;
  const _Bullet({required this.text});

  @override
  Widget build(BuildContext context) {
    final fg = Colors.black87;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 6, 16, 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle_rounded, color: Color(0xFF5C7CFF)),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.poppins(color: fg, height: 1.45),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatefulWidget {
  final String title;
  final Widget body;
  final bool initExpand;
  const _SectionHeader({
    required this.title,
    required this.body,
    this.initExpand = false,
  });

  @override
  State<_SectionHeader> createState() => _SectionHeaderState();
}

class _SectionHeaderState extends State<_SectionHeader> {
  bool isExpand = false;
  @override
  void initState() {
    super.initState();
    isExpand = widget.initExpand;
  }

  @override
  Widget build(BuildContext context) {
    final t = GoogleFonts.poppins(fontWeight: FontWeight.w700, fontSize: 14.5);
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Text(widget.title, style: t)),
            IconButton(
              onPressed: () {
                setState(() {
                  isExpand = !isExpand;
                });
              },
              icon: Icon(
                isExpand ? Icons.remove_rounded : Icons.add_rounded,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        Visibility(
          visible: isExpand,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 6, 0, 8),
            child: widget.body,
          ),
        ),
      ],
    );
  }
}

class _Lesson {
  final String title;
  final String duration;
  const _Lesson(this.title, this.duration);
}

class _LessonTile extends StatelessWidget {
  final int index;
  final _Lesson lesson;
  const _LessonTile({required this.index, required this.lesson});

  @override
  Widget build(BuildContext context) {
    final title = GoogleFonts.poppins(
      fontWeight: FontWeight.w700,
      fontSize: 15.5,
    );
    final sub = GoogleFonts.poppins(color: Colors.black54, fontSize: 13);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            index.toString(),
            style: GoogleFonts.poppins(fontWeight: FontWeight.w700),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(lesson.title, style: title),
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(lesson.duration, style: sub),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              shape: BoxShape.circle,
            ),
            child: const Padding(
              padding: EdgeInsets.all(6),
              child: Icon(Icons.play_arrow_rounded, size: 22),
            ),
          ),
        ],
      ),
    );
  }
}
