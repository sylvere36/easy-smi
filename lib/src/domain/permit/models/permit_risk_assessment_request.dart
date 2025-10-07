class PermitRiskAssessmentRequest {
  final int id;
  final int workPermitId;
  final int evaluatorId;
  final List<PermitRiskAssessmentQuestionInput> questions;
  final String status;
  final String conclusion;

  const PermitRiskAssessmentRequest({
    required this.id,
    required this.workPermitId,
    required this.evaluatorId,
    required this.questions,
    required this.status,
    required this.conclusion,
  });

  factory PermitRiskAssessmentRequest.fromJson(Map<String, dynamic> json) {
    return PermitRiskAssessmentRequest(
      id: (json['id'] as num).toInt(),
      workPermitId: (json['workPermitId'] as num).toInt(),
      evaluatorId: (json['evaluatorId'] as num).toInt(),
      questions: (json['questions'] as List<dynamic>).map((e) {
        final m = e as Map<String, dynamic>;
        return PermitRiskAssessmentQuestionInput(
          response: m['response'] as bool,
          evidences: (m['evidences'] as List<dynamic>? ?? const [])
              .map((x) => x as String)
              .toList(),
          comment: m['comment'] as String,
        );
      }).toList(),
      status: json['status'] as String,
      conclusion: json['conclusion'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'workPermitId': workPermitId,
      'evaluatorId': evaluatorId,
      'questions': questions
          .map(
            (q) => {
              'response': q.response,
              'evidences': q.evidences,
              'comment': q.comment,
            },
          )
          .toList(),
      'status': status,
      'conclusion': conclusion,
    };
  }
}

class PermitRiskAssessmentQuestionInput {
  final bool response;
  final List<String> evidences; // local file paths
  final String comment;

  const PermitRiskAssessmentQuestionInput({
    required this.response,
    this.evidences = const [],
    required this.comment,
  });
}
