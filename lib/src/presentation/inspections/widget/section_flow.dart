import 'dart:io';
import 'dart:math' as math;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../../application/inspection/form/inspection_form_bloc.dart';
import '../../../domain/inspection/models/inspection_answers_post.dart';
import '../../../domain/inspection/models/inspection_detail.dart'
    show InspectionQuestionLite, InspectionSectionWithQuestions;
import '../../_commons/route/app_router.gr.dart';
import '../../_commons/theming/app_color.dart';

///* ==================== SCREEN ==================== */

class SectionFlowScreen extends StatefulWidget {
  const SectionFlowScreen({
    super.key,
    required this.title,
    required this.inspectionId,
    required this.inspectionFormId,
  });
  final String title;
  final int inspectionId;
  final int inspectionFormId;

  @override
  State<SectionFlowScreen> createState() => _SectionFlowScreenState();
}

class _SectionFlowScreenState extends State<SectionFlowScreen> {
  List<SectionData> _sections = [];
  int _sectionIndex = 0;
  int _qIndex = -1; // -1 = écran “carte de section”
  final Map<int, List<InspectionAnswerPostItem>> _answersBySection = {};
  final Map<int, String> _sectionTitles = {};
  final Map<int, String> _questionTitles = {};
  // Persistent input state
  final Map<int, TextEditingController> _commentCtrls = {};
  final Map<int, TextEditingController> _textCtrls = {};
  final Map<int, bool?> _boolAnswers = {}; // true/false/null
  final Map<int, bool> _naTouched = {}; // for yes_no_na explicit NA
  final Map<int, List<String>> _imagesByQuestion = {}; // local file paths

  @override
  void initState() {
    super.initState();
  }

  SectionData get current => _sections[_sectionIndex];

  void _toNext() {
    setState(() {
      if (_qIndex < 0) {
        _qIndex = 0;
      } else if (_qIndex < current.questions.length - 1) {
        final q = current.questions[_qIndex];
        if (!_isAnswered(q)) {
          // disable navigation when unanswered
          return;
        }
        _saveAnswer(current, q);
        _qIndex++;
      } else {
        final q = current.questions[_qIndex];
        if (!_isAnswered(q)) {
          // disable navigation when unanswered
          return;
        }
        _saveAnswer(current, q);
        // section suivante
        if (_sectionIndex < _sections.length - 1) {
          _sectionIndex++;
          _qIndex = -1;
        } else if (_sectionIndex == _sections.length - 1) {
          _logAnswers();
          context.router.push(
            InspectionResultRoute(
              answersBySection: _answersBySection,
              sectionTitles: _sectionTitles,
              questionTitles: _questionTitles,
              inspectionId: widget.inspectionId,
              inspectionFormId: widget.inspectionFormId,
            ),
          );
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _sections.isEmpty ? AppColors.primary : current.color,
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
      body: BlocBuilder<InspectionFormBloc, InspectionFormState>(
        builder: (context, state) {
          if (state.isLoading && state.sections.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          if (_sections.isEmpty && state.sections.isNotEmpty) {
            _sections = _mapSections(state.sections);
            // map titles for result payload
            for (final s in state.sections) {
              _sectionTitles[s.id] = s.title;
              for (final q in s.questions) {
                _questionTitles[q.id] = q.label;
              }
            }
          }
          if (_sections.isEmpty) {
            return const Center(child: Text('Aucune section disponible'));
          }
          final themeColor = current.color;
          return Container(
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
                    commentCtrls: _commentCtrls,
                    textCtrls: _textCtrls,
                    boolAnswers: _boolAnswers,
                    naTouched: _naTouched,
                    imagesByQuestion: _imagesByQuestion,
                  ),
          );
        },
      ),
    );
  }

  void _logAnswers() {
    for (final e in _answersBySection.entries) {
      // ignore: avoid_print
      print('Section ${e.key}: ${e.value.length} réponses');
    }
  }

  List<SectionData> _mapSections(
    List<InspectionSectionWithQuestions> sections,
  ) {
    final colors = [const Color(0xFF17B79B), const Color(0xFFFF8A34)];
    return [
      for (int i = 0; i < sections.length; i++)
        SectionData(
          id: sections[i].id,
          name: sections[i].title,
          color: colors[i % colors.length],
          questions: [
            for (final q in sections[i].questions)
              Question(
                id: q.id,
                meta: q,
                title: q.label,
                explanation: q.explanationNote ?? '',
                type: q.isBoolean || q.isBooleanWithNan
                    ? QuestionType.boolean
                    : q.isMeasurement
                    ? QuestionType.number
                    : QuestionType.text,
              ),
          ],
        ),
    ];
  }

  bool _isAnswered(Question q) {
    // boolean
    if (q.type == QuestionType.boolean) {
      final v = _boolAnswers[q.id ?? -1];
      final touched = _naTouched[q.id ?? -1] == true;
      if ((q.meta?.isBooleanWithNan ?? false) && v == null && touched) {
        return true;
      }
      return v != null;
    }
    // text/number
    final ctrl = _textCtrls[q.id ?? -1];
    if (ctrl != null) return ctrl.text.trim().isNotEmpty;
    return (q.text ?? '').trim().isNotEmpty;
  }

  void _saveAnswer(SectionData section, Question q) {
    final id = q.id ?? -1;
    String ans;
    if (q.type == QuestionType.boolean) {
      final v = _boolAnswers[id];
      final touched = _naTouched[id] == true;
      if ((q.meta?.isBooleanWithNan ?? false) && v == null && touched) {
        ans = 'na';
      } else {
        ans = v == null ? '' : (v ? 'yes' : 'no');
      }
    } else {
      ans = (_textCtrls[id]?.text ?? q.text ?? '').trim();
    }
    final isOk = q.meta?.isConforme(ans) ?? false;
    final status = q.meta?.isBooleanWithNan == true && ans == 'na'
        ? 'na'
        : (isOk ? 'conform' : 'non_conform');
    final item = InspectionAnswerPostItem(
      inspectionId: widget.inspectionId,
      inspectionQuestionId: q.id ?? 0,
      answer: ans,
      conformityStatus: status,
      comment: _commentCtrls[id]?.text.trim().isEmpty == true
          ? null
          : _commentCtrls[id]?.text.trim() ?? q.comment,
      imageLinks: List<String>.from(_imagesByQuestion[id] ?? const []),
    );
    final list = _answersBySection[section.id] ?? <InspectionAnswerPostItem>[];
    final idx = list.indexWhere(
      (e) => e.inspectionQuestionId == item.inspectionQuestionId,
    );
    if (idx >= 0) {
      list[idx] = item;
    } else {
      list.add(item);
    }
    _answersBySection[section.id] = list;
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
    required this.commentCtrls,
    required this.textCtrls,
    required this.boolAnswers,
    required this.naTouched,
    required this.imagesByQuestion,
  });

  final Color color;
  final String sectionName;
  final List<Question> questions;
  final int qIndex;
  final VoidCallback onPrev;
  final VoidCallback onNext;
  final VoidCallback onUpdate;
  final Map<int, TextEditingController> commentCtrls;
  final Map<int, TextEditingController> textCtrls;
  final Map<int, bool?> boolAnswers;
  final Map<int, bool> naTouched;
  final Map<int, List<String>> imagesByQuestion;

  @override
  Widget build(BuildContext context) {
    final q = questions[qIndex];
    final int qid = q.id ?? -1;
    commentCtrls[qid] ??= TextEditingController(text: q.comment ?? '');
    if (q.type != QuestionType.boolean) {
      textCtrls[qid] ??= TextEditingController(text: q.text ?? '');
    }

    final bool answered = () {
      // Mirror _isAnswered logic locally using provided maps
      if (q.type == QuestionType.boolean) {
        final v = boolAnswers[qid];
        final touched = naTouched[qid] == true;
        if ((q.meta?.isBooleanWithNan ?? false) && v == null && touched) {
          return true;
        }
        return v != null;
      }
      final ctrl = textCtrls[qid];
      if (ctrl != null) return ctrl.text.trim().isNotEmpty;
      return (q.text ?? '').trim().isNotEmpty;
    }();

    // Compute current answer string and conformity status/color for display
    String currentAnswerString() {
      if (q.type == QuestionType.boolean) {
        final v = boolAnswers[qid];
        final touched = naTouched[qid] == true;
        if ((q.meta?.isBooleanWithNan ?? false) && v == null && touched) {
          return 'na';
        }
        if (v == null) return '';
        return v ? 'yes' : 'no';
      }
      return (textCtrls[qid]?.text ?? q.text ?? '').trim();
    }

    final String ansStr = currentAnswerString();
    String statusText = '';
    Color statusColor = Colors.transparent;
    if (ansStr.isNotEmpty) {
      if (ansStr == 'na') {
        statusText = 'N/A';
        statusColor = Colors.grey;
      } else {
        final ok = q.meta?.isConforme(ansStr) ?? false;
        statusText = ok ? 'Conforme' : 'Non Conforme';
        statusColor = ok ? const Color(0xFF25B66E) : const Color(0xFFE03B3B);
      }
    }

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
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (q.explanation.isNotEmpty)
                          IconButton(
                            onPressed: () {
                              _showInfo(context, q.explanation);
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
                              value: boolAnswers[qid],
                              allowNa: q.meta?.isBooleanWithNan ?? false,
                              onChanged: (v) {
                                boolAnswers[qid] = v;
                                // record explicit N/A selection for yes_no_na
                                naTouched[qid] =
                                    (q.meta?.isBooleanWithNan ?? false) &&
                                    v == null;
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
                              controller: textCtrls[qid],
                              onChanged: (t) {
                                // controller already holds text
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
                              controller: textCtrls[qid],
                              onChanged: (t) {
                                // controller already holds text
                                onUpdate();
                              },
                            ),
                          ),

                        // statut à droite
                        if (statusText.isNotEmpty)
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 6),
                              child: Text(
                                statusText,
                                style: TextStyle(
                                  color: statusColor,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),

                        // selected images preview above comment
                        if ((imagesByQuestion[qid] ?? const []).isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: SizedBox(
                              height: 70,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (ctx, i) {
                                  final path = imagesByQuestion[qid]![i];
                                  return Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: AspectRatio(
                                          aspectRatio: 4 / 3,
                                          child: Image.file(
                                            File(path),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: GestureDetector(
                                          behavior: HitTestBehavior.opaque,
                                          onTap: () {
                                            imagesByQuestion[qid]!.removeAt(i);
                                            onUpdate();
                                          },
                                          child: Container(
                                            height: 24,
                                            width: 24,
                                            decoration: const BoxDecoration(
                                              color: Colors.black87,
                                              shape: BoxShape.circle,
                                            ),
                                            alignment: Alignment.center,
                                            child: const Icon(
                                              Icons.close,
                                              size: 14,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                                separatorBuilder: (_, i) =>
                                    const SizedBox(width: 8),
                                itemCount: imagesByQuestion[qid]!.length,
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
                                  GestureDetector(
                                    onTap: () async {
                                      final picker = ImagePicker();
                                      final pic = await picker.pickImage(
                                        source: ImageSource.gallery,
                                      );
                                      if (pic != null) {
                                        final list =
                                            imagesByQuestion[qid] ?? <String>[];
                                        list.add(pic.path);
                                        imagesByQuestion[qid] = list;
                                        onUpdate();
                                      }
                                    },
                                    child: Icon(
                                      Icons.attachment_rounded,
                                      size: 25,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: GestureDetector(
                                      onTap: () async {
                                        final picker = ImagePicker();
                                        final pic = await picker.pickImage(
                                          source: ImageSource.camera,
                                        );
                                        if (pic != null) {
                                          final list =
                                              imagesByQuestion[qid] ??
                                              <String>[];
                                          list.add(pic.path);
                                          imagesByQuestion[qid] = list;
                                          onUpdate();
                                        }
                                      },
                                      child: Icon(
                                        Icons.photo_camera_outlined,
                                        size: 25,
                                        color: Colors.grey.shade700,
                                      ),
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
                                  onTap: answered ? onNext : null,
                                  disabled: !answered,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // champ commentaire
                        Padding(
                          padding: const EdgeInsets.only(top: 30, bottom: 50),
                          child: _CommentField(
                            controller: commentCtrls[qid],
                            onChanged: (t) {
                              // controller keeps text
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

  void _showInfo(BuildContext context, String explanation) {
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
                      explanation,
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
    this.allowNa = false,
    required this.onChanged,
  });

  final Color color;
  final bool? value; // true = oui, false = non, null = n/a
  final bool allowNa;
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
        if (allowNa)
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
    this.controller,
  });

  final String hint;
  final TextInputType keyboard;
  final int maxLines;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
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
  const _CommentField({this.onChanged, this.controller});
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
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
  const _NavBubble({
    required this.color,
    this.onTap,
    this.isLeft = true,
    this.disabled = false,
  });

  final Color color;
  final VoidCallback? onTap;
  final bool isLeft;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: disabled ? 0.4 : 1,
      child: Material(
        color: color,
        shape: const CircleBorder(),
        child: InkWell(
          onTap: disabled ? null : onTap,
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
  Question({
    required this.title,
    required this.type,
    this.id,
    this.meta,
    required this.explanation,
  });

  final int? id;
  final String title;
  final QuestionType type;
  final InspectionQuestionLite? meta;
  final String explanation;

  /// Responses
  bool? yes; // for boolean
  String? text; // text or number
  String? comment;
  bool touched = false; // for yes_no_na to record an explicit N/A
  final List<String> imageLinks = [];

  /// flat answer text for posting
  String get answerString {
    switch (type) {
      case QuestionType.boolean:
        if (meta?.isBooleanWithNan == true) {
          if (yes == null && touched) return 'na';
        }
        if (yes == null) return '';
        return yes == true ? 'yes' : 'no';
      case QuestionType.text:
      case QuestionType.number:
        return (text ?? '').trim();
    }
  }

  /// computed status via domain helper
  String get status {
    final ans = answerString;
    if (ans.isEmpty) return '';
    final ok = meta?.isConforme(ans) ?? false;
    return ok ? 'Conforme' : 'Non Conforme';
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
    required this.id,
    required this.name,
    required this.color,
    required this.questions,
  });

  final int id;
  final String name;
  final Color color; // theme (vert / orange)
  final List<Question> questions;
}
