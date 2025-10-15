class ZoneItem {
  final int id;
  final int organizationId;
  final String label;
  final String? createdAt;
  final String? updatedAt;

  ZoneItem({
    required this.id,
    required this.organizationId,
    required this.label,
    this.createdAt,
    this.updatedAt,
  });

  factory ZoneItem.fromJson(Map<String, dynamic> json) => ZoneItem(
    id: (json['id'] as num?)?.toInt() ?? 0,
    organizationId: (json['organization_id'] as num?)?.toInt() ?? 0,
    label: (json['label'] as String?) ?? '',
    createdAt: json['created_at']?.toString(),
    updatedAt: json['updated_at']?.toString(),
  );
}
