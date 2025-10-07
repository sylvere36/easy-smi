class PermitFireControl {
  final int id;
  final int userId;
  final String controllerName;
  final String? verificationDate;
  final num? gasLevelResult;
  final String conclusion;
  final String conclusionLabel;
  final String? createdAt;

  PermitFireControl({
    required this.id,
    required this.userId,
    required this.controllerName,
    required this.verificationDate,
    required this.gasLevelResult,
    required this.conclusion,
    required this.conclusionLabel,
    required this.createdAt,
  });

  factory PermitFireControl.fromJson(Map<String, dynamic> json) {
    return PermitFireControl(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num?)?.toInt() ?? 0,
      controllerName: (json['controller_name'] as String?) ?? '',
      verificationDate: json['verification_date']?.toString(),
      gasLevelResult: json['gas_level_result'] as num?,
      conclusion: (json['conclusion'] as String?) ?? '',
      conclusionLabel: (json['conclusion_label'] as String?) ?? '',
      createdAt: json['created_at']?.toString(),
    );
  }

  
}
