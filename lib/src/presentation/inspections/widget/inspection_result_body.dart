import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../gen/assets.gen.dart';
import '../../../application/inspection/detail/inspection_detail_bloc.dart';
import '../../../domain/inspection/models/inspection_answers_post.dart';
import '../../_commons/route/app_router.gr.dart';
import '../../_commons/theming/app_color.dart';
import '../../_commons_widgets/loading_widget.dart';
import '../../_commons_widgets/show_network_image_viewer.dart';

class InspectionResultBody extends StatefulWidget {
  const InspectionResultBody({
    super.key,
    required this.answersBySection,
    required this.sectionTitles,
    this.questionTitles = const {},
    required this.inspectionId,
    required this.inspectionFormId,
  });

  final Map<int, List<InspectionAnswerPostItem>> answersBySection;
  final Map<int, String> sectionTitles;
  final Map<int, String> questionTitles;
  final int inspectionId;
  final int inspectionFormId;

  @override
  State<InspectionResultBody> createState() => _InspectionResultBodyState();
}

class _InspectionResultBodyState extends State<InspectionResultBody> {
  late List<ResultSection> sections;

  @override
  void initState() {
    super.initState();
    if (widget.answersBySection.isNotEmpty) {
      sections = _buildFromPayload();
    } else {
      // Fallback demo data (shouldn't be used in production)
      sections = [];
    }
  }

  List<ResultSection> _buildFromPayload() {
    final List<ResultSection> res = [];
    widget.answersBySection.forEach((sectionId, items) {
      final title = widget.sectionTitles[sectionId] ?? 'Section $sectionId';
      final questions = <QuestionResult>[];
      for (final it in items) {
        final qId = it.inspectionQuestionId.toString();
        final t =
            widget.questionTitles[it.inspectionQuestionId] ??
            'Question ${it.inspectionQuestionId}';
        final ans = it.answer.toLowerCase();
        Answer? answer;
        String? text;
        if (ans == 'yes') {
          answer = Answer.oui;
        } else if (ans == 'no') {
          answer = Answer.non;
        } else if (ans == 'na') {
          answer = Answer.na;
        } else {
          text = it.answer;
        }
        final status = it.conformityStatus.toLowerCase();
        questions.add(
          QuestionResult(
            id: qId,
            title: t,
            answer: answer,
            text: text,
            comment: it.comment ?? '',
            evidences: it.imageLinks,
            status: status.isEmpty ? null : status,
          ),
        );
      }
      res.add(ResultSection(title: title, questions: questions));
    });
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<InspectionDetailBloc, InspectionDetailState>(
        builder: (context, state) {
          return state.isLoading == true
              ? const Center(child: LoadingWidget())
              : Column(
                  children: [
                    _header(context, state.item?.mission ?? ''),
                    for (final s in sections) _section(s),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 20,
                      ),
                      child: _conclusionButton(),
                    ),
                  ],
                );
        },
      ),
    );
  }

  // ---------- Header “pills” ----------
  Widget _header(BuildContext context, String mission) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_pill(context, text: mission)],
      ),
    );
  }

  Widget _pill(BuildContext c, {required String text}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: -4,
            color: Color(0x1A000000),
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: Colors.black87,
        ),
      ),
    );
  }

  // ---------- Section block ----------
  Widget _section(ResultSection s) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: const [
            BoxShadow(
              blurRadius: 10,
              spreadRadius: -6,
              color: Color(0x1A000000),
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // section title
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 14, 14, 6),
              child: Row(
                children: [
                  const Icon(Icons.segment_rounded, color: _primary, size: 16),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      'Section : ${s.title}',
                      style: _labelSmall(context, color: Colors.black87),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            // questions
            for (int i = 0; i < s.questions.length; i++)
              _questionTile(index: i + 1, q: s.questions[i]),
            const Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Divider(height: 1),
            ),
          ],
        ),
      ),
    );
  }

  // ---------- Question Tile ----------
  Widget _questionTile({required int index, required QuestionResult q}) {
    // Badge based on status: conform / non_conform / na
    final st = (q.status ?? '').toLowerCase();
    late final Color badgeColor;
    late final String badgeText;
    if (st == 'na') {
      badgeColor = Colors.grey;
      badgeText = 'N/A';
    } else if (st == 'conform') {
      badgeColor = _ok;
      badgeText = 'Conformité détectée';
    } else if (st == 'non_conform') {
      badgeColor = _danger;
      badgeText = 'Non conformité détectée';
    } else {
      // Fallback: infer from answer when no status provided
      final isOk = q.answer == Answer.oui;
      badgeColor = isOk ? _ok : _danger;
      badgeText = isOk ? 'Conformité détectée' : 'Non conformité détectée';
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 10, 14, 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // title + badge
          Row(
            children: [
              Text('Question $index', style: _title(context)),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: badgeColor.withValues(alpha: .08),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: badgeColor.withValues(alpha: .25),
                    ),
                  ),
                  child: Text(badgeText, style: _badge(context, badgeColor)),
                ),
              ),
            ],
          ),

          // question text
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 4),
            child: Text(q.title, style: _body(context)),
          ),

          // answer row (chips + score when exists)
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                if (q.answer != null)
                  Row(
                    children: [
                      _answerChip(
                        'OUI',
                        selected: q.answer == Answer.oui,
                        selectedColor: _ok,
                        onTap: () => setState(() => q.answer = Answer.oui),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: _answerChip(
                          'NON',
                          selected: q.answer == Answer.non,
                          selectedColor: _danger,
                          onTap: () => setState(() => q.answer = Answer.non),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: _answerChip(
                          'N/A',
                          selected: q.answer == Answer.na,
                          selectedColor: _warning,
                          onTap: () => setState(() => q.answer = Answer.na),
                        ),
                      ),
                    ],
                  ),
                if (q.score != null)
                  GestureDetector(
                    onTap: () => _editScore(q),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: Text(
                              '${q.score}',
                              style: _labelSmall(context),
                            ),
                          ),
                          Assets.svgs.pen.svg(),
                        ],
                      ),
                    ),
                  ),

                if (q.text != null)
                  GestureDetector(
                    onTap: () => _editResponseText(q),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                              ),
                              child: Text(
                                '${q.text}',
                                style: _labelSmall(context),
                              ),
                            ),
                          ),
                          Assets.svgs.pen.svg(),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),

          // "Votre commentaire" + edit
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 4),
            child: Row(
              children: [
                Text('Votre commentaire', style: _labelSmall(context)),
                GestureDetector(
                  onTap: () => _editComment(q),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Assets.svgs.pen.svg(),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: Text(
              q.comment.isEmpty ? '—' : q.comment,
              style: _body(context),
            ),
          ),

          // proofs
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 6),
            child: Text('Preuves', style: _labelSmall(context)),
          ),
          _evidenceRow(q.evidences),

          const Padding(
            padding: EdgeInsets.only(top: 12, bottom: 8),
            child: Divider(height: 1),
          ),
        ],
      ),
    );
  }

  // ---------- Reusable chips / rows ----------
  Widget _answerChip(
    String text, {
    required bool selected,
    required Color selectedColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: selected ? selectedColor : _chipGrey,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          text,
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w800,
            color: selected ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }

  Widget _evidenceRow(List<String> urls) {
    if (urls.isEmpty) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Text('Aucune pièce jointe', style: _body(context)),
      );
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: SizedBox(
        height: 68,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(right: 8),
          itemCount: urls.length,
          separatorBuilder: (_, _) => const SizedBox(width: 8),
          itemBuilder: (_, i) {
            final u = urls[i];
            final isFileUri = u.startsWith('file://');
            final isAbsolutePath =
                !u.contains('://') &&
                (u.startsWith('/') ||
                    u.contains('Library/') ||
                    u.contains('tmp/'));
            if (isFileUri || isAbsolutePath) {
              // Local file
              final path = isFileUri ? Uri.parse(u).toFilePath() : u;
              return InkWell(
                onTap: () {
                  // Simple fullscreen preview for local file
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => Scaffold(
                        backgroundColor: Colors.black,
                        appBar: AppBar(
                          backgroundColor: Colors.black,
                          iconTheme: const IconThemeData(color: Colors.white),
                        ),
                        body: Center(
                          child: InteractiveViewer(
                            child: Image.file(File(path), fit: BoxFit.contain),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: AspectRatio(
                    aspectRatio: 4 / 3,
                    child: Image.file(
                      File(path),
                      fit: BoxFit.cover,
                      errorBuilder: (_, _, _) => const ColoredBox(
                        color: Color(0xFFECEFF1),
                        child: Center(child: Icon(Icons.broken_image)),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              // Network image
              return InkWell(
                onTap: () {
                  // Open only the tapped image to avoid mixing with local paths
                  showNetworkImageViewer(context, images: [u]);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: AspectRatio(
                    aspectRatio: 4 / 3,
                    child: Image.network(
                      u,
                      fit: BoxFit.cover,
                      errorBuilder: (_, _, _) => const ColoredBox(
                        color: Color(0xFFECEFF1),
                        child: Center(child: Icon(Icons.broken_image)),
                      ),
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  // ---------- Editors ----------
  Future<void> _editComment(QuestionResult q) async {
    final controller = TextEditingController(text: q.comment);
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (c) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(c).viewInsets.bottom + 16,
            left: 16,
            right: 16,
            top: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Modifier le commentaire', style: _title(c)),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextField(
                  controller: controller,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Écrire…',
                    filled: true,
                    fillColor: const Color(0xFFF4F6F8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _primary,
                    minimumSize: const Size.fromHeight(44),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    setState(() => q.comment = controller.text.trim());
                    Navigator.pop(c);
                  },
                  child: Text(
                    'Enregistrer',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _editScore(QuestionResult q) async {
    final controller = TextEditingController(text: (q.score ?? 0).toString());
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (c) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(c).viewInsets.bottom + 16,
            left: 16,
            right: 16,
            top: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Score de la question', style: _title(c)),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextFormField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Ce champ est requis'
                      : null,
                  decoration: InputDecoration(
                    hintText: 'Ex: 80',
                    filled: true,
                    fillColor: const Color(0xFFF4F6F8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _primary,
                    minimumSize: const Size.fromHeight(44),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    final v = int.tryParse(controller.text);
                    setState(() => q.score = v);
                    Navigator.pop(c);
                  },
                  child: Text(
                    'Valider',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _editResponseText(QuestionResult q) async {
    final controller = TextEditingController(text: q.text);
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (c) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(c).viewInsets.bottom + 16,
            left: 16,
            right: 16,
            top: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Modifier ma réponse', style: _title(c)),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextFormField(
                  controller: controller,
                  minLines: 3,
                  maxLines: 5,
                  keyboardType: TextInputType.text,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Ce champ est requis'
                      : null,
                  decoration: InputDecoration(
                    hintText: 'Texte',
                    filled: true,
                    fillColor: const Color(0xFFF4F6F8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _primary,
                    minimumSize: const Size.fromHeight(44),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: controller.text.isEmpty
                      ? null
                      : () {
                          final v = controller.text;
                          setState(() => q.text = v);
                          Navigator.pop(c);
                        },
                  child: Text(
                    'Valider',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // ---------- Conclusion Button ----------
  Widget _conclusionButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: _primary,
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 0,
      ),
      onPressed: () {
        context.router.push(
          InspectionResultSavingRoute(
            inspectionId: widget.inspectionId,
            inspectionFormId: widget.inspectionFormId,
            answers: InspectionAnswersPostBody(
              answers: widget.answersBySection.entries
                  .map((e) => e.value)
                  .expand((element) => element)
                  .toList(),
            ),
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'CONCLUSION',
            style: GoogleFonts.inter(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              letterSpacing: .3,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 6),
            child: Icon(Icons.chevron_right, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

/// ---------- DATA MODELS ----------
enum Answer { oui, non, na }

class QuestionResult {
  final String id;
  final String title;
  Answer? answer;
  int? score; // ex: 80
  String? text;
  String comment;
  List<String> evidences; // image urls
  // Optional backend/domain status: 'conform' | 'non_conform' | 'na'
  final String? status;
  bool get isConform => answer == Answer.oui && (score == null || score! >= 70);

  QuestionResult({
    required this.id,
    required this.title,
    this.answer,
    this.score,
    this.text,
    this.comment = '',
    this.evidences = const [],
    this.status,
  });
}

class ResultSection {
  final String title;
  final List<QuestionResult> questions;
  ResultSection({required this.title, required this.questions});
}

/// ---------- THEME HELPERS ----------
const _primary = AppColors.primary;
const _danger = Color(0xFFE53935);
const _ok = Color(0xFF2E7D32);
const _warning = Color(0xFFF57C00);
const _chipGrey = Color(0xFFF1F3F5);

TextStyle _title(BuildContext c) =>
    GoogleFonts.ubuntu(fontSize: 18, fontWeight: FontWeight.w700);

TextStyle _labelSmall(BuildContext c, {Color? color}) => GoogleFonts.inter(
  fontSize: 15,
  fontWeight: FontWeight.w700,
  color: color ?? Colors.black,
);

TextStyle _body(BuildContext c) =>
    GoogleFonts.inter(fontSize: 12.5, height: 1.28);

TextStyle _badge(BuildContext c, Color color) =>
    GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w800, color: color);
