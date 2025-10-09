import 'package:flutter/material.dart';

class InspectionStatistics {
  final int totalAnswers;
  final int conformAnswers;
  final int nonConformAnswers;
  final num conformityRate;
  final int nonConformitiesCount;

  InspectionStatistics({
    required this.totalAnswers,
    required this.conformAnswers,
    required this.nonConformAnswers,
    required this.conformityRate,
    required this.nonConformitiesCount,
  });

  factory InspectionStatistics.fromJson(Map<String, dynamic> json) {
    return InspectionStatistics(
      totalAnswers: (json['total_answers'] as num?)?.toInt() ?? 0,
      conformAnswers: (json['conform_answers'] as num?)?.toInt() ?? 0,
      nonConformAnswers: (json['non_conform_answers'] as num?)?.toInt() ?? 0,
      conformityRate: (json['conformity_rate'] as num?) ?? 0,
      nonConformitiesCount:
          (json['non_conformities_count'] as num?)?.toInt() ?? 0,
    );
  }
}

class InspectionFormLite {
  final int id;
  final int organizationId;
  final String label;
  final String? description;
  final String periodicity;
  final String domain;
  final String? reference;
  final String? status;

  InspectionFormLite({
    required this.id,
    required this.organizationId,
    required this.label,
    required this.description,
    required this.periodicity,
    required this.domain,
    this.reference,
    this.status,
  });

  factory InspectionFormLite.fromJson(Map<String, dynamic> json) {
    return InspectionFormLite(
      id: (json['id'] as num).toInt(),
      organizationId: (json['organization_id'] as num?)?.toInt() ?? 0,
      label: (json['label'] as String?) ?? '',
      description: json['description'] as String?,
      periodicity: (json['periodicity'] as String?) ?? '',
      domain: (json['domain'] as String?) ?? '',
      reference: json['reference'] as String?,
      status: json['status'] as String?,
    );
  }
}

String humanReadableStatus(String status) {
  switch (status.toLowerCase()) {
    case 'pending':
      return 'En attente';
    case 'in_progress':
      return 'En cours';
    case 'completed':
      return 'Terminé';
    case 'closed':
      return 'Clôturé';
    case 'inprogress_revision':
      return 'En cours de Révision';
    case 'inprogress_validation':
      return 'En cours de Validation';
    case 'completed_approved':
      return 'Terminé - Approuvé';
    case 'completed_rejected':
      return 'Terminé et Rejeté';
    case 'cancelled':
      return 'Annulé';
    case 'tobevalidated':
      return 'À valider';
    default:
      return status;
  }
}

Color statusColor(String status) {
  switch (status.toLowerCase()) {
    case 'pending':
      return Colors.orange;
    case 'in_progress':
      return Colors.blue;
    case 'completed':
      return Colors.green;
    case 'closed':
      return Colors.grey;
    case 'inprogress_revision':
      return Colors.purple;
    case 'inprogress_validation':
      return Colors.blueAccent;
    case 'completed_approved':
      return Colors.green;
    case 'completed_rejected':
      return Colors.red;
    case 'cancelled':
      return Colors.redAccent;
    case 'tobevalidated':
      return Colors.orange;
    default:
      return Colors.black;
  }
}

class InspectionItem {
  final int id;
  final int inspectionFormId;
  final int organizationId;
  final List<int> inspectorIds;
  final List<int> siteIds;
  final String mission;
  final String? description;
  final String? otherRemark;
  final String? recommendation;
  final String? inspectedAt;
  final String? createdAt;
  final String? updatedAt;
  final String status;
  final String? revision;
  final String? version;
  final String? summary;
  final String? object;
  final String? partieRevisee;
  final String? printPath;
  final String? reference;
  final InspectionStatistics statistics;
  final InspectionFormLite inspectionForm;

  InspectionItem({
    required this.id,
    required this.inspectionFormId,
    required this.organizationId,
    required this.inspectorIds,
    required this.siteIds,
    required this.mission,
    required this.description,
    required this.otherRemark,
    required this.recommendation,
    required this.inspectedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.revision,
    required this.version,
    required this.summary,
    required this.object,
    required this.partieRevisee,
    required this.printPath,
    required this.reference,
    required this.statistics,
    required this.inspectionForm,
  });

  factory InspectionItem.fromJson(Map<String, dynamic> json) {
    List<int> toIntList(dynamic v) {
      final list = v as List<dynamic>? ?? [];
      return list.map((e) => (e as num).toInt()).toList();
    }

    return InspectionItem(
      id: (json['id'] as num).toInt(),
      inspectionFormId: (json['inspection_form_id'] as num?)?.toInt() ?? 0,
      organizationId: (json['organization_id'] as num?)?.toInt() ?? 0,
      inspectorIds: toIntList(json['inspector_ids']),
      siteIds: toIntList(json['site_ids']),
      mission: (json['mission'] as String?) ?? '',
      description: json['description'] as String?,
      otherRemark: json['other_remark'] as String?,
      recommendation: json['recommendation'] as String?,
      inspectedAt: json['inspected_at'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      status: (json['status'] as String?) ?? '',
      revision: json['revision']?.toString(),
      version: json['version']?.toString(),
      summary: json['summary'] as String?,
      object: json['object'] as String?,
      partieRevisee: json['partie_revisee'] as String?,
      printPath: json['print'] as String?,
      reference: json['reference'] as String?,
      statistics: InspectionStatistics.fromJson(
        json['statistics'] as Map<String, dynamic>? ?? const {},
      ),
      inspectionForm: InspectionFormLite.fromJson(
        json['inspection_form'] as Map<String, dynamic>? ?? const {},
      ),
    );
  }

  bool get canEdit =>
      status.toLowerCase() == 'pending' ||
      status.toLowerCase() == 'in_progress';

  String get readableStatus => humanReadableStatus(status);

  Color get statusColorValue => statusColor(status);
}
