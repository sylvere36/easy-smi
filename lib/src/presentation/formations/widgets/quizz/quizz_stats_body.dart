import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../_commons/route/app_router.gr.dart';

/// ---------- Model ----------

class QuizQuestion {
  final String title;
  final List<String> options;
  final int correctIndex;
  final int? selectedIndex;

  const QuizQuestion({
    required this.title,
    required this.options,
    required this.correctIndex,
    this.selectedIndex,
  });

  bool get isAnswered => selectedIndex != null;
  bool get isCorrect => selectedIndex == correctIndex;
}

/// Helpers
int totalCorrect(List<QuizQuestion> items) =>
    items.where((q) => q.isCorrect).length;

double scorePercent(List<QuizQuestion> items) =>
    items.isEmpty ? 0 : totalCorrect(items) / items.length;

/// ---------- Pages ----------

/// Résumé & score
class QuizzStatsBody extends StatelessWidget {
  const QuizzStatsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<QuizQuestion> questions = data;
    final percent = scorePercent(questions);
    final correct = totalCorrect(questions);
    final total = questions.length;
    final wrong = total - correct;

    return Scaffold(
      body: Stack(
        children: [
          // Top header zone with circular score
          Column(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFF2D2458),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        left: 8,
                        top: 8,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      _AnimatedRing(percent: percent),
                    ],
                  ),
                ),
              ),
              const Expanded(flex: 6, child: SizedBox()),
            ],
          ),

          // Floating white card with stats
          Align(
            alignment: const Alignment(0, -0.05),
            child: _StatsCard(
              percent: percent,
              correct: correct,
              wrong: wrong,
              total: total,
            ),
          ),

          // Bottom actions
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 26,
                vertical: 24,
              ).copyWith(bottom: 75),
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                runSpacing: 22,
                spacing: 22,
                children: [
                  _ActionIcon(
                    label: 'Ressayer',
                    icon: Icons.refresh,
                    color: const Color(0xFF128494),
                    onTap: () {
                      Navigator.pop(context);
                      // context.router.push(const QuizzRoute());
                    },
                  ),
                  _ActionIcon(
                    label: 'Mes reponses',
                    icon: Icons.visibility,
                    color: const Color(0xFFB5804F),
                    onTap: () {
                      context.router.push(const QuizzResponsesRoute());
                    },
                  ),
                  _ActionIcon(
                    label: 'Partager',
                    icon: Icons.share,
                    color: const Color(0xFF5E7BEF),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Partager…')),
                      );
                    },
                  ),
                  _ActionIcon(
                    label: 'Certificat',
                    icon: Icons.badge_outlined,
                    color: const Color(0xFF15A677),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Certificat…')),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AnimatedRing extends StatelessWidget {
  final double percent;
  const _AnimatedRing({required this.percent});

  @override
  Widget build(BuildContext context) {
    final purple = const Color(0xFF8A44E4);

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: percent),
      duration: const Duration(milliseconds: 900),
      curve: Curves.easeOutCubic,
      builder: (context, value, _) {
        return SizedBox(
          width: 220,
          height: 220,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Outer soft ring
              Container(
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                  color: Colors.white12,
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                width: 155,
                height: 155,
                decoration: const BoxDecoration(
                  color: Colors.white38,
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                width: 130,
                height: 130,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),

              // Percentage text
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${(value * 100).round()}',
                    style: GoogleFonts.dmSans(
                      color: purple,
                      fontWeight: FontWeight.w700,
                      fontSize: 40,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      '%',
                      style: GoogleFonts.dmSans(
                        color: purple,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _StatsCard extends StatelessWidget {
  final double percent;
  final int correct, wrong, total;
  const _StatsCard({
    required this.percent,
    required this.correct,
    required this.wrong,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      padding: const EdgeInsets.fromLTRB(22, 20, 22, 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .12),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _metricItem(
                dot: const Color(0xFF8A44E4),
                title: '${(percent * 100).round()}%',
                subtitle: 'Reussite',
              ),
              _metricItem(
                dot: const Color(0xFF8A44E4),
                title: total.toString().padLeft(2, '0'),
                subtitle: 'Total Question',
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _metricItem(
                dot: const Color(0xFF1E8E3E),
                title: correct.toString().padLeft(2, '0'),
                subtitle: 'Correct',
              ),
              _metricItem(
                dot: const Color(0xFFE53935),
                title: wrong.toString().padLeft(2, '0'),
                subtitle: 'Echec',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _metricItem({
    required Color dot,
    required String title,
    required String subtitle,
  }) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 12,
            height: 12,
            margin: const EdgeInsets.only(right: 10, top: 8),
            decoration: BoxDecoration(color: dot, shape: BoxShape.circle),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  color: dot,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              Text(
                subtitle,
                style: GoogleFonts.poppins(color: Colors.black87, fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ActionIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;
  const _ActionIcon({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: SizedBox(
        width: (MediaQuery.of(context).size.width - 26 * 2 - 22 * 2) / 3,
        child: Column(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              child: Icon(icon, color: Colors.white, size: 30),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final data = <QuizQuestion>[
  const QuizQuestion(
    title:
        'Quelle est la première étape pour instaurer une relation de confiance avec un client ?',
    options: [
      'Lui proposer directement une solution',
      'Écouter activement ses besoins',
      'Mettre en avant les atouts de l’entreprise',
      'Réduire le prix',
    ],
    correctIndex: 1,
    selectedIndex: 1,
  ),
  const QuizQuestion(
    title: 'Un client satisfait en parle en moyenne à :',
    options: [
      '01 Personne',
      '03 Personnes',
      '05 Personnes',
      '10 personnes ou plus',
    ],
    correctIndex: 3,
    selectedIndex: 3,
  ),
  const QuizQuestion(
    title:
        'Parmi ces comportements, lequel renforce le plus la confiance d’un client ?',
    options: [
      'Être toujours disponible, même sans écoute',
      'Respecter ses engagements et tenir parole',
      'Promettre plus que ce que l’on peut offrir',
      'Parler surtout de soi et de son expertise',
    ],
    correctIndex: 1,
    selectedIndex: 2,
  ),
];
