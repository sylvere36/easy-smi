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
