class QuizzSubmissionAnswer {
  final int questionQuizzId;
  final int answerQuizzId;
  const QuizzSubmissionAnswer({
    required this.questionQuizzId,
    required this.answerQuizzId,
  });

  Map<String, dynamic> toJson() => {
    'question_quizz_id': questionQuizzId,
    'answer_quizz_id': answerQuizzId,
  };
}

class QuizzSubmissionRequest {
  final int userId;
  final int quizzId;
  final List<QuizzSubmissionAnswer> reponses;
  const QuizzSubmissionRequest({
    required this.userId,
    required this.quizzId,
    required this.reponses,
  });

  Map<String, dynamic> toJson() => {
    'user_id': userId,
    'quizz_id': quizzId,
    'reponses': reponses.map((e) => e.toJson()).toList(),
  };
}

class QuizzSubmissionDetailResult {
  final int questionQuizzId;
  final int answerQuizzId;
  final bool isCorrect;
  const QuizzSubmissionDetailResult({
    required this.questionQuizzId,
    required this.answerQuizzId,
    required this.isCorrect,
  });

  factory QuizzSubmissionDetailResult.fromJson(Map<String, dynamic> json) =>
      QuizzSubmissionDetailResult(
        questionQuizzId: (json['question_quizz_id'] as num).toInt(),
        answerQuizzId: (json['answer_quizz_id'] as num).toInt(),
        isCorrect: json['is_correct'] as bool,
      );
}

class QuizzSubmissionResult {
  final int score;
  final String resultat;
  final List<QuizzSubmissionDetailResult> details;
  const QuizzSubmissionResult({
    required this.score,
    required this.resultat,
    required this.details,
  });

  factory QuizzSubmissionResult.fromJson(Map<String, dynamic> json) =>
      QuizzSubmissionResult(
        score: (json['score'] as num).toInt(),
        resultat: json['resultat'] as String,
        details: (json['details'] as List<dynamic>? ?? const [])
            .whereType<Map<String, dynamic>>()
            .map(QuizzSubmissionDetailResult.fromJson)
            .toList(),
      );
}
