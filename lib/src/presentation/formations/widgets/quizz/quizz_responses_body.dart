import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../domain/quizz/models/quizz_answer.dart';
import '../../../../domain/quizz/models/quizz_item.dart';
import '../../../../domain/quizz/models/quizz_question.dart';
import '../../../../domain/quizz/models/quizz_submission.dart';

class QuizzResponseBody extends StatelessWidget {
  final QuizzSubmissionResult result;
  final QuizzItem quizzItem;
  const QuizzResponseBody({
    super.key,
    required this.result,
    required this.quizzItem,
  });

  @override
  Widget build(BuildContext context) {
    // Map questionId -> selected answerId & correctness
    final Map<int, QuizzSubmissionDetailResult> detailByQuestion = {
      for (final d in result.details) d.questionQuizzId: d,
    };

    final questions = quizzItem.questions;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          'Mes reponses',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        backgroundColor: const Color(0xFF221D47), // deep purple
      ),
      backgroundColor: const Color(0xFF221D47), // deep purple
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 24)),

          SliverList.separated(
            itemBuilder: (_, i) {
              final q = questions[i];
              final selected = detailByQuestion[q.id]?.answerQuizzId;
              return _QuestionReviewCard(
                index: i,
                question: q,
                selectedAnswerId: selected,
              );
            },
            separatorBuilder: (_, _) => const SizedBox(height: 14),
            itemCount: questions.length,
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }
}

class _QuestionReviewCard extends StatelessWidget {
  final int index;
  final QuizzQuestion question;
  final int? selectedAnswerId;
  const _QuestionReviewCard({
    required this.index,
    required this.question,
    required this.selectedAnswerId,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = GoogleFonts.poppins(
      color: Colors.white,
      height: 1.25,
      fontSize: 18,
      fontWeight: FontWeight.w700,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Step chip
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: .08),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.white24),
            ),
            child: Text(
              (index + 1).toString().padLeft(2, '0'),
              style: GoogleFonts.poppins(
                color: Colors.white70,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(question.question, style: titleStyle),
          const SizedBox(height: 12),
          // Options
          ...question.answers.map((a) {
            final state = _stateFor(a, question.answers, selectedAnswerId);
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _AnswerPill(text: a.answer, state: state),
            );
          }),
        ],
      ),
    );
  }

  /// UI state logic: highlight correct in green, wrong selection in red.
  _AnswerState _stateFor(
    QuizzAnswer answer,
    List<QuizzAnswer> answers,
    int? selectedId,
  ) {
    final int correctId = answers
        .firstWhere((e) => (e.isCorrect ?? 0) == 1, orElse: () => answers.first)
        .id; // fallback to first if unknown
    if (answer.id == correctId) return _AnswerState.correct;
    if (selectedId != null && answer.id == selectedId) {
      return _AnswerState.wrong;
    }
    return _AnswerState.neutral;
  }
}

enum _AnswerState { correct, wrong, neutral }

class _AnswerPill extends StatelessWidget {
  final String text;
  final _AnswerState state;
  const _AnswerPill({required this.text, required this.state});

  @override
  Widget build(BuildContext context) {
    final isCorrect = state == _AnswerState.correct;
    final isWrong = state == _AnswerState.wrong;

    final bg = isCorrect
        ? const Color(0xFF17A34A)
        : Colors.white; // white for wrong/neutral
    final fg = isCorrect ? Colors.white : const Color(0xFF2E2E2E);
    final border = isWrong
        ? Border.all(color: const Color(0xFFE53935), width: 3)
        : Border.all(color: Colors.transparent);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        color: bg,
        border: border,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .18),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: isWrong ? const Color(0xFFE53935) : fg,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
