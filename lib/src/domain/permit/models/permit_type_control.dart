class PermitTypeControl {
  final int id;
  final int workPermitId;
  final String when; // e.g., before_start, during_work
  final String timeInterval; // e.g., day, week
  final int? intervalValue;
  final String? createdAt;
  final String? updatedAt;
  final int inspectionFormId;

  PermitTypeControl({
    required this.id,
    required this.workPermitId,
    required this.when,
    required this.timeInterval,
    required this.intervalValue,
    required this.createdAt,
    required this.updatedAt,
    required this.inspectionFormId,
  });

  factory PermitTypeControl.fromJson(Map<String, dynamic> json) {
    return PermitTypeControl(
      id: (json['id'] as num).toInt(),
      workPermitId: (json['work_permit_id'] as num?)?.toInt() ?? 0,
      when: (json['when'] as String?) ?? '',
      timeInterval: (json['time_interval'] as String?) ?? '',
      intervalValue: (json['interval_value'] as num?)?.toInt(),
      createdAt: json['created_at']?.toString(),
      updatedAt: json['updated_at']?.toString(),
      inspectionFormId: (json['inspection_form_id'] as num?)?.toInt() ?? 0,
    );
  }
}
