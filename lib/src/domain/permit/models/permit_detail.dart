class PermitDetail {
  final int id;
  final int organizationId;
  final String title;
  final String? description;
  final String workType;
  final String status;
  final String? revision;
  final String? reference;
  final String? summary;
  final String? object;
  final String? partieRevisee;
  final String? printPath; // 'print' in API
  final String? version;
  final String? stopStatus;
  final bool? isElimited;
  final bool? isArchieved;
  final bool? isNormal;
  final String? location;
  final String? startDate;
  final String? endDate;
  final String? averageDuration;
  final String? createdAt;
  final String? updatedAt;

  PermitDetail({
    required this.id,
    required this.organizationId,
    required this.title,
    required this.description,
    required this.workType,
    required this.status,
    this.revision,
    this.reference,
    this.summary,
    this.object,
    this.partieRevisee,
    this.printPath,
    this.version,
    this.stopStatus,
    this.isElimited,
    this.isArchieved,
    this.isNormal,
    this.location,
    this.startDate,
    this.endDate,
    this.averageDuration,
    this.createdAt,
    this.updatedAt,
  });

  factory PermitDetail.fromJson(Map<String, dynamic> json) {
    bool? toBool(dynamic v) {
      if (v == null) return null;
      if (v is bool) return v;
      if (v is num) return v != 0;
      if (v is String) return v == '1' || v.toLowerCase() == 'true';
      return null;
    }

    return PermitDetail(
      id: (json['id'] as num).toInt(),
      organizationId: (json['organization_id'] as num?)?.toInt() ?? 0,
      title: (json['title'] as String?) ?? '',
      description: json['description'] as String?,
      workType: (json['work_type'] as String?) ?? '',
      status: (json['status'] as String?) ?? '',
      revision: json['revision']?.toString(),
      reference: json['reference'] as String?,
      summary: json['summary'] as String?,
      object: json['object'] as String?,
      partieRevisee: json['partie_revisee'] as String?,
      printPath: json['print'] as String?,
      version: json['version']?.toString(),
      stopStatus: json['stop_status']?.toString(),
      isElimited: toBool(json['is_elimited']),
      isArchieved: toBool(json['is_archieved']),
      isNormal: toBool(json['is_normal']),
      location: json['location'] as String?,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      averageDuration: json['average_duration']?.toString(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }
}
