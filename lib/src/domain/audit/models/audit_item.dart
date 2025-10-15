String humanReadableStatus(String status) {
  switch (status) {
    case 'draft':
      return 'Brouillon';
    case 'pendingValidation':
      return 'En attente de validation';
    case 'planned':
      return 'Planifié';
    case 'validated':
      return 'Validé';
    case 'inProgress':
      return 'En cours';
    case 'inProgress_Revision':
      return 'En cours - Révision';
    case 'closed':
      return 'Clôturé';
    case 'archived':
      return 'Archivé';
    default:
      return status;
  }
}

String humanReadableType(String type) {
  switch (type) {
    case 'internal':
      return 'Interne';
    case 'external':
      return 'Externe';
    case 'regulatory':
      return 'Réglementaire';
    case 'certification':
      return 'Certification';
    default:
      return type;
  }
}

class AuditItem {
  final int id;
  final String label;
  final String? description;
  final String? type;
  final String? startDate;
  final String? endDate;
  final String? status;
  final String? summary;
  final String? object;
  final String? partieRevisee;
  final String? version;
  final String? print;
  final String? reference;
  final dynamic auditor; // Unknown shape, keep dynamic/null
  final dynamic audited; // Unknown shape, keep dynamic/null
  final AuditProcess? process;
  final String? createdAt;
  final String? updatedAt;
  final List<ControlPointSummary> controlPointsSummary;

  AuditItem({
    required this.id,
    required this.label,
    this.description,
    this.type,
    this.startDate,
    this.endDate,
    this.status,
    this.summary,
    this.object,
    this.partieRevisee,
    this.version,
    this.print,
    this.reference,
    this.auditor,
    this.audited,
    this.process,
    this.createdAt,
    this.updatedAt,
    required this.controlPointsSummary,
  });

  factory AuditItem.fromJson(Map<String, dynamic> json) {
    return AuditItem(
      id: json['id'] as int,
      label: (json['label'] as String?) ?? '',
      description: json['description'] as String?,
      type: json['type'] as String?,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      status: json['status'] as String?,
      summary: json['summary'] as String?,
      object: json['object'] as String?,
      partieRevisee: json['partie_revisee'] as String?,
      version: json['version'] as String?,
      print: json['print'] as String?,
      reference: json['reference'] as String?,
      auditor: json['auditor'],
      audited: json['audited'],
      process: json['process'] == null
          ? null
          : AuditProcess.fromJson(json['process'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      controlPointsSummary:
          (json['control_points_summary'] as List<dynamic>? ?? [])
              .whereType<Map<String, dynamic>>()
              .map((e) => ControlPointSummary.fromJson(e))
              .toList(),
    );
  }

  String get statusHumanReadable {
    if (status == null) return '';
    return humanReadableStatus(status!);
  }

  String get typeHumanReadable {
    if (type == null) return '';
    return humanReadableType(type!);
  }

  bool get enCours {
    return status == 'inProgress' || status == 'inProgress_Revision';
  }
}

class AuditProcess {
  final int id;
  final String title;
  final String? description;
  final String? type;
  final int? organizationId;

  AuditProcess({
    required this.id,
    required this.title,
    this.description,
    this.type,
    this.organizationId,
  });

  factory AuditProcess.fromJson(Map<String, dynamic> json) {
    return AuditProcess(
      id: json['id'] as int,
      title: (json['title'] as String?) ?? '',
      description: json['description'] as String?,
      type: json['type'] as String?,
      organizationId: json['organization_id'] as int?,
    );
  }
}

class ControlPointSummary {
  final int id;
  final int auditId;
  final String title;
  final String? description;
  final String? reference;
  final String? createdAt;
  final String? updatedAt;

  ControlPointSummary({
    required this.id,
    required this.auditId,
    required this.title,
    this.description,
    this.reference,
    this.createdAt,
    this.updatedAt,
  });

  factory ControlPointSummary.fromJson(Map<String, dynamic> json) {
    return ControlPointSummary(
      id: json['id'] as int,
      auditId: json['audit_id'] as int,
      title: (json['title'] as String?) ?? '',
      description: json['description'] as String?,
      reference: json['reference'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }
}
