class PermitPersonnelAssignment {
  final int id;
  final int userId;
  final String fullName;
  final bool? isChargedPort;
  final String assignmentType;
  final String assignmentTypeLabel;
  final String training;
  final String trainingLabel;
  final String? createdAt;
  final String? updatedAt;

  PermitPersonnelAssignment({
    required this.id,
    required this.userId,
    required this.fullName,
    required this.isChargedPort,
    required this.assignmentType,
    required this.assignmentTypeLabel,
    required this.training,
    required this.trainingLabel,
    this.createdAt,
    this.updatedAt,
  });

  factory PermitPersonnelAssignment.fromJson(Map<String, dynamic> json) {
    bool? toBool(dynamic v) {
      if (v == null) return null;
      if (v is bool) return v;
      if (v is num) return v != 0;
      if (v is String) return v == '1' || v.toLowerCase() == 'true';
      return null;
    }

    return PermitPersonnelAssignment(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num?)?.toInt() ?? 0,
      fullName: (json['full_name'] as String?) ?? '',
      isChargedPort: toBool(json['is_charged_port']),
      assignmentType: (json['assignment_type'] as String?) ?? '',
      assignmentTypeLabel: (json['assignment_type_label'] as String?) ?? '',
      training: (json['training'] as String?) ?? '',
      trainingLabel: (json['training_label'] as String?) ?? '',
      createdAt: json['created_at']?.toString(),
      updatedAt: json['updated_at']?.toString(),
    );
  }

  bool get qualified => training == 'qualified';
}
