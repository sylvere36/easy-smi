class OrganizationSettings {
  final int id;
  final String adminEmail;
  final String baseUrl;
  final String? createdAt;
  final String? updatedAt;

  const OrganizationSettings({
    required this.id,
    required this.adminEmail,
    required this.baseUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OrganizationSettings.fromJson(Map<String, dynamic> json) {
    return OrganizationSettings(
      id: (json['id'] as num).toInt(),
      adminEmail: json['admin_email'] as String,
      baseUrl: json['base_url'] as String,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'admin_email': adminEmail,
    'base_url': baseUrl,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };
}
