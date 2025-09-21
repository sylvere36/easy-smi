class OrganizationLicense {
  final int id;
  final int? organizationId;
  final String adminEmail;
  final String dateIssuing;
  final String status;
  final String dateStarted;
  final String dateEnd;
  final String typeLicense;
  final String createdAt;
  final String updatedAt;

  const OrganizationLicense({
    required this.id,
    required this.organizationId,
    required this.adminEmail,
    required this.dateIssuing,
    required this.status,
    required this.dateStarted,
    required this.dateEnd,
    required this.typeLicense,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OrganizationLicense.fromJson(Map<String, dynamic> json) {
    return OrganizationLicense(
      id: (json['id'] as num).toInt(),
      organizationId: (json['organization_id'] as num?)?.toInt(),
      adminEmail: json['admin_email'] as String,
      dateIssuing: json['date_issuing'] as String,
      status: json['status'] as String,
      dateStarted: json['date_started'] as String,
      dateEnd: json['date_end'] as String,
      typeLicense: json['type_license'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'organization_id': organizationId,
    'admin_email': adminEmail,
    'date_issuing': dateIssuing,
    'status': status,
    'date_started': dateStarted,
    'date_end': dateEnd,
    'type_license': typeLicense,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };
}
