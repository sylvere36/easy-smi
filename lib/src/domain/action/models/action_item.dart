class ActionProcess {
  final int id;
  final String title;
  final String reference;
  final String status;

  const ActionProcess({
    required this.id,
    required this.title,
    required this.reference,
    required this.status,
  });

  factory ActionProcess.fromJson(Map<String, dynamic> json) {
    return ActionProcess(
      id: (json['id'] as num).toInt(),
      title: (json['title'] ?? '') as String,
      reference: (json['reference'] ?? '') as String,
      status: (json['status'] ?? '') as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'reference': reference,
    'status': status,
  };
}

class ActionItem {
  final int id;
  final String actionName;
  final String actionType;
  final int? processId;
  final String? originType;
  final int? originId;
  final String? justificationType;
  final String? justification;
  final String? startDate; // ISO date string
  final String? creationDate; // may be null
  final String? endDate; // ISO date string
  final int? inChargeId;
  final String? actionStatus;
  final String? document;
  final String? reference;
  final String? version;
  final String? createdAt;
  final String? updatedAt;
  final int? organizationId;
  final String? summary;
  final String? objet;
  final String? partieRevisee;
  final String? printPath; // maps from 'print'
  final ActionProcess? process;
  final int? durationDays;
  final String? inChargeName;
  final dynamic origin; // leave as dynamic for simplicity
  final int? commentsCount;

  const ActionItem({
    required this.id,
    required this.actionName,
    required this.actionType,
    this.processId,
    this.originType,
    this.originId,
    this.justificationType,
    this.justification,
    this.startDate,
    this.creationDate,
    this.endDate,
    this.inChargeId,
    this.actionStatus,
    this.document,
    this.reference,
    this.version,
    this.createdAt,
    this.updatedAt,
    this.organizationId,
    this.summary,
    this.objet,
    this.partieRevisee,
    this.printPath,
    this.process,
    this.durationDays,
    this.inChargeName,
    this.origin,
    this.commentsCount,
  });

  factory ActionItem.fromJson(Map<String, dynamic> json) {
    return ActionItem(
      id: (json['id'] as num).toInt(),
      actionName: (json['action_name'] ?? '') as String,
      actionType: (json['action_type'] ?? '') as String,
      processId: (json['process_id'] as num?)?.toInt(),
      originType: json['origin_type'] as String?,
      originId: (json['origin_id'] as num?)?.toInt(),
      justificationType: json['justification_type'] as String?,
      justification: json['justification'] as String?,
      startDate: json['start_date'] as String?,
      creationDate: json['creation_date'] as String?,
      endDate: json['end_date'] as String?,
      inChargeId: (json['in_charge_id'] as num?)?.toInt(),
      actionStatus: json['action_status'] as String?,
      document: json['document'] as String?,
      reference: json['reference'] as String?,
      version: json['version'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      organizationId: (json['organization_id'] as num?)?.toInt(),
      summary: json['summary'] as String?,
      objet: json['objet'] as String?,
      partieRevisee: json['partie_revisee'] as String?,
      printPath: json['print'] as String?,
      process: json['process'] is Map<String, dynamic>
          ? ActionProcess.fromJson(json['process'] as Map<String, dynamic>)
          : null,
      durationDays: (json['duration_days'] as num?)?.toInt(),
      inChargeName: json['in_charge_name'] as String?,
      origin: json['origin'],
      commentsCount: (json['comments_count'] as num?)?.toInt(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'action_name': actionName,
    'action_type': actionType,
    'process_id': processId,
    'origin_type': originType,
    'origin_id': originId,
    'justification_type': justificationType,
    'justification': justification,
    'start_date': startDate,
    'creation_date': creationDate,
    'end_date': endDate,
    'in_charge_id': inChargeId,
    'action_status': actionStatus,
    'document': document,
    'reference': reference,
    'version': version,
    'created_at': createdAt,
    'updated_at': updatedAt,
    'organization_id': organizationId,
    'summary': summary,
    'objet': objet,
    'partie_revisee': partieRevisee,
    'print': printPath,
    'process': process?.toJson(),
    'duration_days': durationDays,
    'in_charge_name': inChargeName,
    'origin': origin,
    'comments_count': commentsCount,
  };
}
