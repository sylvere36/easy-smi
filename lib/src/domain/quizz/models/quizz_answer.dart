class QuizzAnswer {
  final int id;
  final int questionQuizzId;
  final String answer;
  final int? isCorrect; // 1 or 0
  final String? createdAt;
  final String? updatedAt;

  QuizzAnswer({
    required this.id,
    required this.questionQuizzId,
    required this.answer,
    required this.isCorrect,
    required this.createdAt,
    required this.updatedAt,
  });

  factory QuizzAnswer.fromJson(Map<String, dynamic> json) => QuizzAnswer(
    id: (json['id'] as num?)?.toInt() ?? 0,
    questionQuizzId:
        (json['question_quizz_id'] as num?)?.toInt() ??
        (json['questionQuizzId'] as num?)?.toInt() ??
        0,
    answer: (json['answer'] as String?) ?? '',
    isCorrect:
        (json['is_correct'] as num?)?.toInt() ??
        (json['isCorrect'] as num?)?.toInt(),
    createdAt:
        (json['created_at'] as String?) ?? (json['createdAt'] as String?),
    updatedAt:
        (json['updated_at'] as String?) ?? (json['updatedAt'] as String?),
  );
}
