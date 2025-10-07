import 'dart:math' as math;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../_commons/theming/app_color.dart';

class RiskAssessmentFlow extends StatefulWidget {
  const RiskAssessmentFlow({super.key, required this.title});
  final String title;

  @override
  State<RiskAssessmentFlow> createState() => _RiskAssessmentFlowState();
}

class _RiskAssessmentFlowState extends State<RiskAssessmentFlow> {
  int _sectionIndex = 0;
  int _qIndex = 0;

  List<Question> questions = [
    Question(
      title:
          "Le chantier est il rangé et nettoyé après les travaux effectué par l'équipe delegué pour la tâche?",
      type: QuestionType.boolean,
    ),
    Question(
      title:
          "Le chantier est il rangé et nettoyé après les travaux effectué par l'équipe delegué pour la tâche?",
      type: QuestionType.boolean,
    ),
    Question(
      title:
          "Le chantier est il rangé et nettoyé après les travaux effectué par l'équipe delegué pour la tâche?",
      type: QuestionType.boolean,
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  void _toNext() {
    setState(() {
      if (_qIndex < 0) {
        _qIndex = 0;
      } else if (_qIndex < questions.length - 1) {
        _qIndex++;
      } else {
        // section suivante
        if (_sectionIndex < questions.length - 1) {
          _sectionIndex++;
          _qIndex = -1;
        } else if (_sectionIndex == questions.length - 1) {
          return;
        }
      }
    });
  }

  void _toPrev() {
    setState(() {
      if (_qIndex > 0) {
        _qIndex--;
      } else if (_qIndex == 0) {
        _qIndex = -1;
      } else {
        if (_sectionIndex > 0) {
          _sectionIndex--;
          _qIndex = -1;
        } else if (_sectionIndex == 0) {
          context.pop();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeColor = AppColors.primary;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: _toPrev,
        ),
        titleSpacing: 0,
        title: Text(
          widget.title.toUpperCase(),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.ubuntu(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: false,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [themeColor, themeColor.withValues(alpha: .9)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: _QuestionView(
          color: themeColor,
          sectionName: 'current.name',
          questions: questions,
          qIndex: _qIndex,
          onPrev: _toPrev,
          onNext: _toNext,
          onUpdate: () => setState(() {}),
        ),
      ),
    );
  }
}

/* ==================== QUESTION VIEW ==================== */

class _QuestionView extends StatelessWidget {
  const _QuestionView({
    required this.color,
    required this.sectionName,
    required this.questions,
    required this.qIndex,
    required this.onPrev,
    required this.onNext,
    required this.onUpdate,
  });

  final Color color;
  final String sectionName;
  final List<Question> questions;
  final int qIndex;
  final VoidCallback onPrev;
  final VoidCallback onNext;
  final VoidCallback onUpdate;

  @override
  Widget build(BuildContext context) {
    final q = questions[qIndex];

    return Stack(
      children: [
        Positioned.fill(
          child: IgnorePointer(
            child: CustomPaint(
              painter: _Bubbles(color: Colors.white.withValues(alpha: .12)),
            ),
          ),
        ),

        // carte question
        Padding(
          padding: const EdgeInsets.only(top: 75),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(28),
                topRight: Radius.circular(28),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 14),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 14, bottom: 20),
                    child: Container(
                      width: 60,
                      height: 5,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2EA0FF),
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
                  // progress dots
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Align(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  questions.length,
                                  (i) => Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          right: 8,
                                        ),
                                        child: Container(
                                          width: 32,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: i == qIndex
                                                ? color
                                                : Colors.black38,
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${i + 1}',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w800,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 18.0,
                                        ),
                                        child: SizedBox(
                                          width: 40,
                                          child: Divider(
                                            thickness: 2,
                                            color: i == qIndex
                                                ? AppColors.primary
                                                : Colors.black38,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )..add(const Spacer()),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // titre
                        Text(
                          q.title,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.ubuntu(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        // réponses selon type
                        Padding(
                          padding: const EdgeInsets.only(top: 18),
                          child: _BooleanRow(
                            color: color,
                            value: q.yes,
                            onChanged: (v) {
                              q.yes = v;
                              onUpdate();
                            },
                          ),
                        ),

                        // statut à droite
                        if (q.status.isNotEmpty)
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 6),
                              child: Text(
                                q.status,
                                style: TextStyle(
                                  color: q.statusColor,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),

                        // nav + commentaire
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                // prev
                                _NavBubble(color: color, onTap: onPrev),
                                const Spacer(),
                                // attach/comment icons above field (right aligned)
                                Row(
                                  children: [
                                    Icon(
                                      Icons.attachment_rounded,
                                      size: 25,
                                      color: Colors.grey.shade700,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Icon(
                                        Icons.photo_camera_outlined,
                                        size: 25,
                                        color: Colors.grey.shade700,
                                      ),
                                    ),
                                  ],
                                ),
                                // next
                                Padding(
                                  padding: const EdgeInsets.only(left: 12),
                                  child: _NavBubble(
                                    isLeft: false,
                                    color: color,
                                    onTap: onNext,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // champ commentaire
                        Padding(
                          padding: const EdgeInsets.only(top: 30, bottom: 50),
                          child: _CommentField(
                            onChanged: (t) {
                              q.comment = t;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/* ==================== ATOMS ==================== */

class _BooleanRow extends StatelessWidget {
  const _BooleanRow({
    required this.color,
    required this.value,
    required this.onChanged,
  });

  final Color color;
  final bool? value; // true = oui, false = non, null = n/a
  final ValueChanged<bool?> onChanged;

  Widget _chip(String label, bool? me) {
    final active = value == me;
    return Container(
      decoration: BoxDecoration(
        color: active ? color : Colors.white,
        border: Border.all(color: color, width: 1.4),
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => onChanged(me),
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            label,
            style: TextStyle(
              color: active ? Colors.white : color,
              fontWeight: FontWeight.w900,
              letterSpacing: .2,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _chip('OUI', true),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: _chip('NON', false),
        ),
      ],
    );
  }
}

class _CommentField extends StatelessWidget {
  const _CommentField({this.onChanged});
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: 1,
      maxLines: 2,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: 'Commentaire',
        filled: true,
        fillColor: const Color(0xFFF6F8FA),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 8, left: 8),
          child: Icon(
            Icons.send_rounded,
            color: Colors.grey.shade700,
            size: 18,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFE2E7EB)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFE2E7EB)),
        ),
      ),
    );
  }
}

class _NavBubble extends StatelessWidget {
  const _NavBubble({required this.color, this.onTap, this.isLeft = true});

  final Color color;
  final VoidCallback? onTap;
  final bool isLeft;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Transform.rotate(
            angle: isLeft ? math.pi : 0,
            child: const Icon(
              Icons.play_arrow_rounded,
              color: Colors.white,
              size: 50,
            ),
          ),
        ),
      ),
    );
  }
}

/* ==================== DECOR ==================== */

class _Bubbles extends CustomPainter {
  _Bubbles({required this.color});
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final centers = <Offset>[
      Offset(size.width * .18, 90),
      Offset(size.width * .85, 110),
      Offset(size.width * .12, size.height * .38),
      Offset(size.width * .82, size.height * .42),
      Offset(size.width * .24, size.height * .72),
      Offset(size.width * .76, size.height * .8),
    ];
    final radii = <double>[26, 18, 22, 18, 24, 22];

    for (var i = 0; i < centers.length; i++) {
      canvas.drawCircle(centers[i], radii[i], paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/* ==================== DATA MODEL ==================== */

enum QuestionType { boolean, text, number }

class Question {
  Question({required this.title, required this.type});

  final String title;
  final QuestionType type;

  /// Responses
  bool? yes; // for boolean
  String? text; // text or number
  String? comment;

  /// computed status
  String get status {
    switch (type) {
      case QuestionType.boolean:
        if (yes == null) return '';
        if (yes == true) return 'Conforme';
        return 'Non Conforme';
      case QuestionType.text:
      case QuestionType.number:
        if ((text ?? '').trim().isEmpty) return '';
        return 'Conforme';
    }
  }

  Color get statusColor {
    final s = status;
    if (s == 'Conforme') return const Color(0xFF25B66E);
    if (s == 'Non Conforme') return const Color(0xFFE03B3B);
    return Colors.transparent;
  }
}

class SectionData {
  SectionData({
    required this.name,
    required this.color,
    required this.questions,
  });

  final String name;
  final Color color; // theme (vert / orange)
  final List<Question> questions;
}
