class FinishFormationResult {
  final int registrationId;
  final String status;
  final String? endDate;

  FinishFormationResult({
    required this.registrationId,
    required this.status,
    required this.endDate,
  });

  factory FinishFormationResult.fromJson(Map<String, dynamic> json) =>
      FinishFormationResult(
        registrationId: (json['registration_id'] as num?)?.toInt() ?? 0,
        status: (json['status'] as String?) ?? '',
        endDate: json['end_date'] as String?,
      );
}
