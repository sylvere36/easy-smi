import 'dart:math' as math;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../_commons/route/app_router.gr.dart';
import '../../_commons/theming/app_color.dart';

///* ==================== SCREEN ==================== */

class SectionFlowScreen extends StatefulWidget {
  const SectionFlowScreen({super.key, required this.title});
  final String title;

  @override
  State<SectionFlowScreen> createState() => _SectionFlowScreenState();
}

class _SectionFlowScreenState extends State<SectionFlowScreen> {
  late final List<SectionData> _sections;
  int _sectionIndex = 0;
  int _qIndex = -1; // -1 = écran “carte de section”

  @override
  void initState() {
    super.initState();
    _sections = [
      SectionData(
        name: 'Aménagement des salles dans le hall',
        color: const Color(0xFF17B79B), // vert
        questions: [
          Question(
            title:
                "Le chantier est il rangé et nettoyé après les travaux effectué par l'équipe delegué pour la tâche?",
            type: QuestionType.boolean,
          ),
          Question(
            title:
                "Le chantier est il rangé et nettoyé après les travaux effectué par l'équipe delegué pour la tâche?",
            type: QuestionType.number,
          ),
          Question(
            title:
                "Le chantier est il rangé et nettoyé après les travaux effectué par l'équipe delegué pour la tâche?",
            type: QuestionType.text,
          ),
        ],
      ),
      SectionData(
        name: 'Aménagement des salles dans le hall',
        color: const Color(0xFFFF8A34), // orange
        questions: [
          Question(
            title:
                "Le chantier est il rangé et nettoyé après les travaux effectué par l'équipe delegué pour la tâche?",
            type: QuestionType.boolean,
          ),
          Question(
            title:
                "Le chantier est il rangé et nettoyé après les travaux effectué par l'équipe delegué pour la tâche?",
            type: QuestionType.text,
          ),
        ],
      ),
    ];
  }

  SectionData get current => _sections[_sectionIndex];

  void _toNext() {
    setState(() {
      if (_qIndex < 0) {
        _qIndex = 0;
      } else if (_qIndex < current.questions.length - 1) {
        _qIndex++;
      } else {
        // section suivante
        if (_sectionIndex < _sections.length - 1) {
          _sectionIndex++;
          _qIndex = -1;
        } else if (_sectionIndex == _sections.length - 1) {
          context.router.push(const InspectionResultRoute());
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
    final themeColor = current.color;

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
        child: _qIndex < 0
            ? _SectionIntroCard(
                color: themeColor,
                index: _sectionIndex + 1,
                title: current.name,
                onNext: _toNext,
              )
            : _QuestionView(
                color: themeColor,
                sectionName: current.name,
                questions: current.questions,
                qIndex: _qIndex,
                onPrev: _toPrev,
                onNext: _toNext,
                onUpdate: () => setState(() {}),
              ),
      ),
    );
  }
}

/* ==================== INTRO CARD ==================== */

class _SectionIntroCard extends StatelessWidget {
  const _SectionIntroCard({
    required this.color,
    required this.index,
    required this.title,
    required this.onNext,
  });

  final Color color;
  final int index;
  final String title;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // petites bulles décoratives
        Positioned.fill(
          child: IgnorePointer(
            child: CustomPaint(
              painter: _Bubbles(color: Colors.white.withValues(alpha: .15)),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Carte
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: .12),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Section $index',
                          style: GoogleFonts.nunito(
                            color: Colors.black54,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            title,
                            style: GoogleFonts.montserrat(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Bouton
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: SizedBox(
                    width: 160,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: onNext,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: color,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 28,
                          vertical: 12,
                        ),
                      ),
                      child: Text(
                        'Suivant',
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
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
        Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              // bandeau titre section
              Container(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: .25),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // section title small
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(
                        'Section : $sectionName',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.ubuntu(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
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
                              child: Wrap(
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
                        IconButton(
                          onPressed: () {
                            _showInfo(context);
                          },
                          icon: const Icon(
                            Icons.info_outline,
                            color: Colors.black,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
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
                        if (q.type == QuestionType.boolean)
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
                          )
                        else if (q.type == QuestionType.number)
                          Padding(
                            padding: const EdgeInsets.only(top: 18),
                            child: _InputField(
                              hint: 'Saisir une valeur',
                              keyboard: TextInputType.number,
                              onChanged: (t) {
                                q.text = t;
                                onUpdate();
                              },
                            ),
                          )
                        else
                          Padding(
                            padding: const EdgeInsets.only(top: 18),
                            child: _InputField(
                              hint: 'Texte',
                              keyboard: TextInputType.text,
                              maxLines: 3,
                              onChanged: (t) {
                                q.text = t;
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
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
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

  void _showInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        elevation: 8,
        insetPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 450),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 14, 18, 10),
            child: Column(
              spacing: 10,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title + close
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          'Note explicative',
                          style: GoogleFonts.mulish(
                            fontSize: 22,
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    InkResponse(
                      onTap: () => Navigator.pop(context),

                      child: Container(
                        height: 27,
                        width: 27,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 1.5),
                        ),
                        child: const Icon(Icons.close),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      'ConclusLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n\n'
                      'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident.ion',
                      style: GoogleFonts.mulish(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
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
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: _chip('N/A', null),
        ),
      ],
    );
  }
}

class _InputField extends StatelessWidget {
  const _InputField({
    required this.hint,
    required this.keyboard,
    this.maxLines = 1,
    this.onChanged,
  });

  final String hint;
  final TextInputType keyboard;
  final int maxLines;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboard,
      maxLines: maxLines,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFFF2F6FA),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFDEE6EE)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFDEE6EE)),
        ),
      ),
      style: const TextStyle(fontWeight: FontWeight.w600),
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
