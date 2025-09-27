/// ---- ENUMS
enum EventStatus {
  draft,
  toBeValidated,
  inProgress,
  inProgressNonCompliant,
  closed,
  validated,
  inProgressRevision,
  unknown,
}

enum EventType {
  accident,
  incident,
  dangerousSituation, // 'dangerous_situation'
  nonConformity, // 'non_conformity'
}

enum EventGravity { minor, major, critical }

/// ---- MAPPERS

EventStatus _statusFromString(String? raw) {
  final v = (raw ?? '').trim();
  switch (v) {
    case 'draft':
      return EventStatus.draft;
    case 'toBeValidated':
      return EventStatus.toBeValidated;
    case 'inProgress':
      return EventStatus.inProgress;
    case 'inProgress_NonCompliant':
      return EventStatus.inProgressNonCompliant;
    case 'closed':
      return EventStatus.closed;
    case 'validated':
      return EventStatus.validated;
    case 'inProgress_Revision':
      return EventStatus.inProgressRevision;
    default:
      return EventStatus.unknown;
  }
}

String _statusToString(EventStatus s) {
  switch (s) {
    case EventStatus.draft:
      return 'draft';
    case EventStatus.toBeValidated:
      return 'toBeValidated';
    case EventStatus.inProgress:
      return 'inProgress';
    case EventStatus.inProgressNonCompliant:
      return 'inProgress_NonCompliant';
    case EventStatus.closed:
      return 'closed';
    case EventStatus.validated:
      return 'validated';
    case EventStatus.inProgressRevision:
      return 'inProgress_Revision';
    case EventStatus.unknown:
      return 'unknown';
  }
}

String _humanStatus(EventStatus s) {
  switch (s) {
    case EventStatus.draft:
      return 'Brouillon';
    case EventStatus.toBeValidated:
      return 'À valider';
    case EventStatus.inProgress:
      return 'En cours';
    case EventStatus.inProgressNonCompliant:
      return 'Non conforme';
    case EventStatus.closed:
      return 'Fermé';
    case EventStatus.validated:
      return 'Validé';
    case EventStatus.inProgressRevision:
      return 'En révision';
    case EventStatus.unknown:
      return 'Inconnu';
  }
}


EventType _typeFromString(String? raw) {
  final v = (raw ?? '').trim();
  switch (v) {
    case 'accident':
      return EventType.accident;
    case 'incident':
      return EventType.incident;
    case 'dangerous_situation':
      return EventType.dangerousSituation;
    case 'non_conformity':
      return EventType.nonConformity;
    default:
      return EventType.incident; // fallback raisonnable
  }
}

String _typeToString(EventType t) {
  switch (t) {
    case EventType.accident:
      return 'accident';
    case EventType.incident:
      return 'incident';
    case EventType.dangerousSituation:
      return 'dangerous_situation';
    case EventType.nonConformity:
      return 'non_conformity';
  }
}

EventGravity _gravityFromString(String? raw) {
  switch ((raw ?? '').trim()) {
    case 'minor':
      return EventGravity.minor;
    case 'major':
      return EventGravity.major;
    case 'critical':
      return EventGravity.critical;
    default:
      return EventGravity.minor;
  }
}

String _gravityToString(EventGravity g) {
  switch (g) {
    case EventGravity.minor:
      return 'minor';
    case EventGravity.major:
      return 'major';
    case EventGravity.critical:
      return 'critical';
  }
}

String _humanGravity(EventGravity g) {
  switch (g) {
    case EventGravity.minor:
      return 'Mineur';
    case EventGravity.major:
      return 'Majeur';
    case EventGravity.critical:
      return 'Critique';
  }
}

/// ---- HELPERS

int? _toInt(dynamic v) {
  if (v == null) return null;
  if (v is int) return v;
  if (v is num) return v.toInt();
  if (v is String) return int.tryParse(v);
  return null;
}

DateTime? _toDate(dynamic v) {
  if (v == null || (v is String && v.isEmpty)) return null;
  return DateTime.tryParse(v.toString());
}

/// ---- MODEL

class EventItem {
  final int id;
  final String title;
  final String? description;
  final EventType type;
  final EventGravity gravity;
  final DateTime? date;
  final String? site;
  final List<int> witnessIds;
  final List<String> attachments;
  final int? organizationId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  // Champs complémentaires
  final String? revision;
  final String? version;
  final String? summary;
  final String? object;
  final String? partieRevisee;
  final String? printPath;
  final String? reference;
  final EventStatus status;

  const EventItem({
    required this.id,
    required this.title,
    this.description,
    required this.type,
    required this.gravity,
    this.date,
    this.site,
    this.witnessIds = const [],
    this.attachments = const [],
    this.organizationId,
    this.createdAt,
    this.updatedAt,
    this.revision,
    this.version,
    this.summary,
    this.object,
    this.partieRevisee,
    this.printPath,
    this.reference,
    this.status = EventStatus.unknown,
  });

  /// JSON -> Model
  factory EventItem.fromJson(Map<String, dynamic> json) {
    final wit =
        (json['witness_ids'] as List?)
            ?.map((e) => _toInt(e))
            .nonNulls
            .toList() ??
        const <int>[];

    final att =
        (json['attachments'] as List?)?.map((e) => e.toString()).toList() ??
        const <String>[];

    return EventItem(
      id: _toInt(json['id']) ?? 0,
      title: json['title']?.toString() ?? '',
      description: json['description']?.toString(),
      type: _typeFromString(json['type']?.toString()),
      gravity: _gravityFromString(json['gravity']?.toString()),
      date: _toDate(json['date']),
      site: json['site']?.toString(),
      witnessIds: wit,
      attachments: att,
      organizationId: _toInt(json['organization_id']),
      createdAt: _toDate(json['created_at']),
      updatedAt: _toDate(json['updated_at']),
      revision: json['revision']?.toString(),
      version: json['version']?.toString(),
      summary: json['summary']?.toString(),
      object: json['object']?.toString(),
      partieRevisee: json['partie_revisee']?.toString(),
      printPath: json['print']?.toString(),
      reference: json['reference']?.toString(),
      status: _statusFromString(json['status']?.toString()),
    );
  }

  /// Model -> JSON (conforme au backend)
  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'type': _typeToString(type),
    'gravity': _gravityToString(gravity),
    'date': date?.toIso8601String(),
    'site': site,
    'witness_ids': witnessIds,
    'attachments': attachments,
    'organization_id': organizationId,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
    'revision': revision,
    'version': version,
    'summary': summary,
    'object': object,
    'partie_revisee': partieRevisee,
    'print': printPath,
    'reference': reference,
    'status': _statusToString(status),
  };

  EventItem copyWith({
    int? id,
    String? title,
    String? description,
    EventType? type,
    EventGravity? gravity,
    DateTime? date,
    String? site,
    List<int>? witnessIds,
    List<String>? attachments,
    int? organizationId,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? revision,
    String? version,
    String? summary,
    String? object,
    String? partieRevisee,
    String? printPath,
    String? reference,
    EventStatus? status,
  }) {
    return EventItem(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      type: type ?? this.type,
      gravity: gravity ?? this.gravity,
      date: date ?? this.date,
      site: site ?? this.site,
      witnessIds: witnessIds ?? this.witnessIds,
      attachments: attachments ?? this.attachments,
      organizationId: organizationId ?? this.organizationId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      revision: revision ?? this.revision,
      version: version ?? this.version,
      summary: summary ?? this.summary,
      object: object ?? this.object,
      partieRevisee: partieRevisee ?? this.partieRevisee,
      printPath: printPath ?? this.printPath,
      reference: reference ?? this.reference,
      status: status ?? this.status,
    );
  }

  // Petits helpers pratiques
  bool get isValidated => status == EventStatus.validated;
  bool get isClosed => status == EventStatus.closed;
  String get humanGravity => _humanGravity(gravity);
  String get humanStatus => _humanStatus(status);
}
