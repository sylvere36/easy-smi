class InspectionAnswerPostItem {
  final int? id;
  final int inspectionId;
  final int inspectionQuestionId;
  final String answer;
  final String conformityStatus;
  final String? comment;
  final List<String> imageLinks;
  final String? createdAt;
  final String? updatedAt;

  InspectionAnswerPostItem({
    this.id,
    required this.inspectionId,
    required this.inspectionQuestionId,
    required this.answer,
    required this.conformityStatus,
    this.comment,
    this.imageLinks = const [],
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toJson() => {
    if (id != null) 'id': id,
    'inspection_id': inspectionId,
    'inspection_question_id': inspectionQuestionId,
    'answer': answer,
    'conformity_status': conformityStatus,
    if (comment != null) 'comment': comment,
    'image_links': imageLinks,
    if (createdAt != null) 'created_at': createdAt,
    if (updatedAt != null) 'updated_at': updatedAt,
  };

  factory InspectionAnswerPostItem.fromJson(Map<String, dynamic> json) =>
      InspectionAnswerPostItem(
        id: (json['id'] as num?)?.toInt(),
        inspectionId: (json['inspection_id'] as num?)?.toInt() ?? 0,
        inspectionQuestionId:
            (json['inspection_question_id'] as num?)?.toInt() ?? 0,
        answer: (json['answer'] as String?) ?? '',
        conformityStatus: (json['conformity_status'] as String?) ?? '',
        comment: json['comment'] as String?,
        imageLinks: (json['image_links'] as List<dynamic>? ?? [])
            .map((e) => e.toString())
            .toList(),
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
      );
}

class InspectionAnswersPostBody {
  final List<InspectionAnswerPostItem> answers;

  InspectionAnswersPostBody({required this.answers});

  Map<String, dynamic> toJson() => {
    'answers': answers.map((e) => e.toJson()).toList(),
  };

  factory InspectionAnswersPostBody.fromJson(Map<String, dynamic> json) =>
      InspectionAnswersPostBody(
        answers: (json['answers'] as List<dynamic>? ?? [])
            .whereType<Map<String, dynamic>>()
            .map(InspectionAnswerPostItem.fromJson)
            .toList(),
      );
}
