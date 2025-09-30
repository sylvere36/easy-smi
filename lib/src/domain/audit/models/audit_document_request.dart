// Simple model classes (no Freezed) for audit document requests

class AuditDocumentRequest {
  final int id;
  final String name;
  final List<AuditAttachedDocument> documents;
  final String? createdAt;

  AuditDocumentRequest({
    required this.id,
    required this.name,
    required this.documents,
    this.createdAt,
  });

  factory AuditDocumentRequest.fromJson(Map<String, dynamic> json) {
    return AuditDocumentRequest(
      id: (json['id'] as num).toInt(),
      name: (json['name'] as String?) ?? '',
      createdAt: json['created_at'] as String?,
      documents: (json['documents'] as List<dynamic>? ?? [])
          .whereType<Map<String, dynamic>>()
          .map((e) => AuditAttachedDocument.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'created_at': createdAt,
    'documents': documents.map((e) => e.toJson()).toList(),
  };
}

class AuditAttachedDocument {
  final int id;
  final int documentRequestId;
  final String documentPath;
  final String? commentId;
  final String? createdAt;
  final String? updatedAt;

  AuditAttachedDocument({
    required this.id,
    required this.documentRequestId,
    required this.documentPath,
    this.commentId,
    this.createdAt,
    this.updatedAt,
  });

  factory AuditAttachedDocument.fromJson(Map<String, dynamic> json) {
    return AuditAttachedDocument(
      id: (json['id'] as num).toInt(),
      documentRequestId: (json['document_request_id'] as num).toInt(),
      documentPath: (json['document_path'] as String?) ?? '',
      commentId: json['comment_id']?.toString(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'document_request_id': documentRequestId,
    'document_path': documentPath,
    'comment_id': commentId,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };
}
