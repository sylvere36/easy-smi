import 'package:flutter/widgets.dart';

String humanReadableWorkType(String workType) {
  switch (workType) {
    case 'dangerous':
      return 'Travail Dangereux';
    case 'normal':
      return 'Travail Normal';
    default:
      return workType;
  }
}

String humanReadableStatus(String status) {
  switch (status) {
    case 'draft':
      return 'En brouillon';
    case 'pending':
      return 'En attente';
    case 'approved':
      return 'Approuvé';
    case 'rejected':
      return 'Rejeté';
    case 'in_progress':
      return 'En cours';
    case 'completed':
      return 'Terminé';
    case 'validated':
      return 'Validé';
    default:
      return status;
  }
}

Color statusColor(String status) {
  switch (status) {
    case 'draft':
      return const Color(0xFF9E9E9E); // Grey
    case 'pending':
      return const Color(0xFFFFA000); // Amber
    case 'approved':
      return const Color(0xFF1976D2); // Blue
    case 'rejected':
      return const Color(0xFFD32F2F); // Red
    case 'in_progress':
      return const Color(0xFF1976D2); // Blue
    case 'completed':
      return const Color(0xFF388E3C); // Green
    case 'validated':
      return const Color(0xFF388E3C); // Green
    default:
      return const Color(0xFF9E9E9E); // Grey
  }
}

class PermitItem {
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

  PermitItem({
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

  factory PermitItem.fromJson(Map<String, dynamic> json) {
    bool? toBool(dynamic v) {
      if (v == null) return null;
      if (v is bool) return v;
      if (v is num) return v != 0;
      if (v is String) return v == '1' || v.toLowerCase() == 'true';
      return null;
    }

    return PermitItem(
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

  String get workTypeReadable => humanReadableWorkType(workType);

  String get statusHumanReadable => humanReadableStatus(status);

  Color get statusColorValue => statusColor(status);
}
