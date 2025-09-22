import 'dart:math' as math;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../_commons/route/app_router.gr.dart';

/// -------------------------------
/// Model
/// -------------------------------
class QuizQuestion {
  final String title;
  final List<String> options;
  QuizQuestion(this.title, this.options);
}

/// -------------------------------
/// Page (tout-en-un)
/// -------------------------------
class CertificationQuiz extends StatefulWidget {
  const CertificationQuiz({super.key});

  @override
  State<CertificationQuiz> createState() => _CertificationQuizState();
}

class _CertificationQuizState extends State<CertificationQuiz> {
  // Fake data (3 questions comme sur tes maquettes)
  final List<QuizQuestion> _questions = [
    QuizQuestion(
      'Quelle est la première étape pour instaurer une relation de confiance avec un client ?',
      [
        'Lui proposer directement une solution',
        'Écouter activement ses besoins',
        'Mettre en avant les atouts de l’entreprise',
        'Réduire le prix',
      ],
    ),
    QuizQuestion('Un client satisfait en parle en moyenne à :', [
      '01 Persone',
      '03 Persones',
      '05 Personnes',
      '10 personnes ou plus',
    ]),
    QuizQuestion(
      'Parmi ces comportements, lequel renforce le plus la confiance d’un client ?',
      [
        'Être toujours disponible, même sans écoute',
        'Respecter ses engagements et tenir parole',
        'Promettre plus que ce que l’on peut offrir',
        'Parler surtout de soi et de son expertise',
      ],
    ),
  ];

  // Index courant (intro = -1, 0..n-1 = questions, submit = n)
  int _index = -1;

  // Réponses choisies (index d’option ou null)
  late final List<int?> _answers = List<int?>.filled(_questions.length, null);

  // ---------- Helpers UI ----------
  TextStyle get _titleStyle => GoogleFonts.montserrat(
    color: Colors.white,
    fontSize: 40,
    height: 1.15,
    fontWeight: FontWeight.w700,
  );

  Color get _primary => const Color(0xFF281F48); // fond sombre violet
  final Gradient _bgGrad = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF2B214F), Color(0xFF3F2A79)],
  );

  // Couleur “accent” (boutons Next)
  final Gradient _ctaGrad = const LinearGradient(
    colors: [Color(0xFFB233FF), Color(0xFF7B2CFF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // ---------------- Actions ----------------
  void _start() => setState(() => _index = 0);
  void _prev() => setState(() => _index = (_index <= 0) ? 0 : _index - 1);
  void _next() {
    if (_index < _questions.length - 1) {
      setState(() => _index++);
    } else {
      setState(() => _index = _questions.length); // écran “Soumettre”
    }
  }

  void _submit() {
    // Ici tu feras ton envoi réseau. On affiche juste une notification.
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Réponses soumises ✅')));
    Navigator.maybePop(context);
    context.router.push(const QuizzResponsesStatsRoute());
  }

  // ----------------- UI Blocks -----------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _primary,
      body: Stack(
        children: [
          _BubblesBackground(gradient: _bgGrad), // bulles floues
          SafeArea(child: _buildBody()),
        ],
      ),
    );
  }

  Widget _buildBody() {
    if (_index == -1) return _buildIntro();
    if (_index == _questions.length) return _buildSubmit();
    return _buildQuestion(_index);
  }

  // ---------- Intro ----------
  Widget _buildIntro() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Back
          IconButton(
            onPressed: () => Navigator.maybePop(context),
            icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
          ),
          const Spacer(),
          const Spacer(),
          // Titre “cartouche” blanc
          _GlassCard(
            child: Text(
              'Orientation client – au cœur de la confiance',
              style: GoogleFonts.montserrat(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF1B1730),
                height: 1.1,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),

          // Play bouton circulaire
          Center(
            child: _CircleAction(
              size: 187,
              inner: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: BoxBorder.all(color: Colors.white, width: 2),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: .25),
                      blurRadius: 24,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.play_circle_filled_rounded,
                  size: 80,
                  color: Colors.white,
                ),
              ),
              onTap: _start,
            ),
          ),
          const SizedBox(height: 34),
          Center(
            child: _PillButton(
              label: 'ANNULER',
              onTap: () => Navigator.maybePop(context),
            ),
          ),
        ],
      ),
    );
  }

  // ---------- Question ----------
  Widget _buildQuestion(int i) {
    final q = _questions[i];
    final progress = (i + 1) / _questions.length;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 4, 20, 20),
      child: Column(
        children: [
          // Top bar: close + progress ring
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _RoundIconButton(
                icon: Icons.close,
                onTap: () => Navigator.maybePop(context),
              ),
              _StepProgress(number: i + 1, progress: progress),
              const SizedBox(width: 56), // symétrie
            ],
          ),
          const SizedBox(height: 2),
          // Question
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(q.title, style: _titleStyle),
            ),
          ),
          const SizedBox(height: 8),
          // Options (gros pills)
          ...List.generate(q.options.length, (idx) {
            final selected = _answers[i] == idx;
            return Padding(
              padding: const EdgeInsets.only(bottom: 18),
              child: _OptionPill(
                text: q.options[idx],
                selected: selected,
                onTap: () => setState(() => _answers[i] = idx),
              ),
            );
          }),
          const SizedBox(height: 8),
          // Nav bottom
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _ArrowButton(direction: AxisDirection.left, onTap: _prev),
              const SizedBox(width: 50),
              _ArrowButton(
                direction: AxisDirection.right,
                enabled: _answers[i] != null,
                gradient: _ctaGrad,
                onTap: _next,
              ),
            ],
          ),
          const SizedBox(height: 6),
        ],
      ),
    );
  }

  // ---------- Submit ----------
  Widget _buildSubmit() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () => setState(() => _index = _questions.length - 1),
              icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
            ),
          ),
          const Spacer(),
          _GlassCard(
            child: Text(
              'Orientation client – au cœur de la confiance',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF1B1730),
                height: 1.1,
              ),
            ),
          ),
          const SizedBox(height: 75),
          _CircleAction(
            size: 187,
            inner: Center(
              child: Text(
                'SOUMETTRE',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1,
                ),
              ),
            ),
            onTap: _submit,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

/// --------------------------------------------
/// Widgets auxiliaires (design system local)
/// --------------------------------------------

class _BubblesBackground extends StatelessWidget {
  const _BubblesBackground({required this.gradient});
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: gradient),
      child: Stack(
        children: [
          for (final cfg in const [
            _BubbleCfg(Offset(-40, 140), 160),
            _BubbleCfg(Offset(40, 360), 140),
            _BubbleCfg(Offset(290, 260), 150),
            _BubbleCfg(Offset(300, 760), 150),
            _BubbleCfg(Offset(40, 980), 140),
            _BubbleCfg(Offset(260, 1100), 140),
          ])
            Positioned(
              left: cfg.offset.dx,
              top: cfg.offset.dy,
              child: Container(
                width: cfg.size,
                height: cfg.size,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: .08),
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _BubbleCfg {
  final Offset offset;
  final double size;
  const _BubbleCfg(this.offset, this.size);
}

class _RoundIconButton extends StatelessWidget {
  const _RoundIconButton({required this.icon, required this.onTap});
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      borderRadius: BorderRadius.circular(26),
      child: Container(
        width: 52,
        height: 52,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: .12),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 28),
      ),
    );
  }
}

class _StepProgress extends StatelessWidget {
  const _StepProgress({required this.number, required this.progress});
  final int number;
  final double progress;

  @override
  Widget build(BuildContext context) {
    final String label = number.toString().padLeft(2, '0');
    return SizedBox(
      width: 82,
      height: 82,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            value: progress,
            strokeWidth: 2,
            color: Colors.white,
            backgroundColor: Colors.white24,
          ),
          Text(
            label,
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _OptionPill extends StatelessWidget {
  const _OptionPill({
    required this.text,
    required this.selected,
    required this.onTap,
  });
  final String text;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final Color ring = const Color(0xFF7E56C6);
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(
            color: selected ? ring : Colors.transparent,
            width: selected ? 3 : 0,
          ),
          boxShadow: [
            const BoxShadow(
              color: Colors.black26,
              blurRadius: 18,
              offset: Offset(0, 8),
            ),
            BoxShadow(
              color: const Color(0xFFB6A6E4).withValues(alpha: .6),
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontSize: 18,
              fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
              color: selected ? ring : const Color(0xFF2B2533),
            ),
          ),
        ),
      ),
    );
  }
}

class _ArrowButton extends StatelessWidget {
  const _ArrowButton({
    required this.direction,
    required this.onTap,
    this.enabled = true,
    this.gradient,
  });

  final AxisDirection direction;
  final bool enabled;
  final VoidCallback onTap;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    final Widget icon = direction == AxisDirection.left
        ? Transform.rotate(
            angle: math.pi,
            child: const Icon(
              Icons.play_arrow_rounded,
              size: 40,
              color: Colors.white,
            ),
          )
        : const Icon(Icons.play_arrow_rounded, size: 40, color: Colors.white);

    final Widget child = Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: enabled
            ? (gradient ??
                  const LinearGradient(
                    colors: [Color(0xFF7E56C6), Color(0xFF7E56C6)],
                  ))
            : null,
        color: enabled ? null : Colors.white.withValues(alpha: .18),
      ),
      child: Center(child: icon),
    );

    return Opacity(
      opacity: enabled ? 1 : .5,
      child: InkWell(
        borderRadius: BorderRadius.circular(40),
        onTap: enabled ? onTap : null,
        child: child,
      ),
    );
  }
}

class _CircleAction extends StatelessWidget {
  const _CircleAction({
    required this.size,
    required this.inner,
    required this.onTap,
  });

  final double size;
  final Widget inner;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      radius: size / 2,
      child: SizedBox(
        width: size,
        height: size,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 6),
              ),
            ),
            inner,
          ],
        ),
      ),
    );
  }
}

class _PillButton extends StatelessWidget {
  const _PillButton({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.white,
          // gradient: const LinearGradient(
          //   colors: [Color(0xFF7CD2E7), Color(0xFF4AD4C6)],
          // ),
        ),
        child: Text(
          label,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w800,

            letterSpacing: .2,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

class _GlassCard extends StatelessWidget {
  const _GlassCard({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFB89AFF).withValues(alpha: .9),
            blurRadius: 18,
          ),
        ],
      ),
      child: child,
    );
  }
}
