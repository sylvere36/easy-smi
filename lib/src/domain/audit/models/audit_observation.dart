class AuditObservation {
  final int id;
  final int auditId;
  final String description;
  final int? commentaireId;
  final List<String> documents;
  final String? createdAt;
  final String? updatedAt;

  AuditObservation({
    required this.id,
    required this.auditId,
    required this.description,
    required this.commentaireId,
    required this.documents,
    this.createdAt,
    this.updatedAt,
  });

  factory AuditObservation.fromJson(Map<String, dynamic> json) {
    return AuditObservation(
      id: (json['id'] as num).toInt(),
      auditId: (json['audit_id'] as num).toInt(),
      description: (json['description'] as String?) ?? '',
      commentaireId: (json['commentaire_id'] as num?)?.toInt(),
      documents: (json['documents'] as List<dynamic>? ?? [])
          .map((e) => e as String)
          .toList(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }
}
