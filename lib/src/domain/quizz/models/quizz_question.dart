import 'quizz_answer.dart';

class QuizzQuestion {
  final int id;
  final int quizzId;
  final String question;
  final String? createdAt;
  final String? updatedAt;
  final List<QuizzAnswer> answers;

  QuizzQuestion({
    required this.id,
    required this.quizzId,
    required this.question,
    required this.createdAt,
    required this.updatedAt,
    required this.answers,
  });

  factory QuizzQuestion.fromJson(Map<String, dynamic> json) => QuizzQuestion(
    id: (json['id'] as num?)?.toInt() ?? 0,
    quizzId:
        (json['quizz_id'] as num?)?.toInt() ??
        (json['quizzId'] as num?)?.toInt() ??
        0,
    question: (json['question'] as String?) ?? '',
    createdAt:
        (json['created_at'] as String?) ?? (json['createdAt'] as String?),
    updatedAt:
        (json['updated_at'] as String?) ?? (json['updatedAt'] as String?),
    answers: ((json['answerquizz'] as List<dynamic>?) ?? const [])
        .whereType<Map<String, dynamic>>()
        .map(QuizzAnswer.fromJson)
        .toList(),
  );
}
