class CauseAnalysis {
  final int id;
  final int eventFormId;
  final String question;
  final String? answer;
  final int orderNumber;
  final DateTime createdAt;
  final DateTime updatedAt;

  const CauseAnalysis({
    required this.id,
    required this.eventFormId,
    required this.question,
    this.answer,
    required this.orderNumber,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CauseAnalysis.fromJson(Map<String, dynamic> json) {
    return CauseAnalysis(
      id: json['id'] as int,
      eventFormId: json['event_form_id'] as int,
      question: json['question'] as String,
      answer: json['answer'] as String?,
      orderNumber: json['order_number'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'event_form_id': eventFormId,
      'question': question,
      'answer': answer,
      'order_number': orderNumber,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
