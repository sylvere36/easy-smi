class PermitRiskAssessment {
  final int id;
  final int evaluatorId;
  final String evaluatorName;
  final String? status;
  final String statusLabel;
  final String? conclusion;
  final String? createdAt;
  final String? updatedAt;

  PermitRiskAssessment({
    required this.id,
    required this.evaluatorId,
    required this.evaluatorName,
    required this.status,
    required this.statusLabel,
    required this.conclusion,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PermitRiskAssessment.fromJson(Map<String, dynamic> json) {
    return PermitRiskAssessment(
      id: (json['id'] as num).toInt(),
      evaluatorId: (json['evaluator_id'] as num?)?.toInt() ?? 0,
      evaluatorName: (json['evaluator_name'] as String?) ?? '',
      status: json['status'] as String?,
      statusLabel: (json['status_label'] as String?) ?? '',
      conclusion: json['conclusion']?.toString(),
      createdAt: json['created_at']?.toString(),
      updatedAt: json['updated_at']?.toString(),
    );
  }

  bool get isConforme => status == 'conforme';
  bool get isNonConforme => status == 'non_conforme';
}
