import 'package:flutter/material.dart';

String humanizeStatus(String? status) {
  switch (status) {
    case 'draft':
      return 'Brouillon';
    case 'published':
      return 'Publié';
    case 'archived':
      return 'Archivé';
    case 'validated':
      return 'Validé';
    case 'closed':
      return 'Clôturé';
    case 'in_progress':
      return 'En cours';
    case 'completed':
      return 'Terminé';
    case 'inProgress_Revision':
      return 'En cours de Révision';
    case 'toBeValidated':
      return 'À valider';
    default:
      return status ?? 'Inconnu';
  }
}

Color bgColor(String? status) {
  switch (status) {
    case 'draft':
      return Colors.orange;
    case 'published':
      return Colors.blue;
    case 'archived':
      return Colors.grey;
    case 'validated':
      return Colors.green;
    case 'closed':
      return Colors.grey;
    case 'in_progress':
      return Colors.blue;
    case 'completed':
      return Colors.green;
    case 'inProgress_Revision':
      return Colors.purple;
    case 'toBeValidated':
      return Colors.orange;
    default:
      return Colors.black12;
  }
}

class InspectionFormItem {
  final int id;
  final int organizationId;
  final String label;
  final String? description;
  final String periodicity;
  final String domain;
  final List<int> inspectorIds;
  final List<int> responsibleIds;
  final List<int> processIds;
  final String? createdAt;
  final String? updatedAt;
  final String? revision;
  final String? version;
  final String? summary;
  final String? object;
  final String? partieRevisee;
  final String? printPath;
  final String? reference;
  final String? status;
  final bool hasSections;
  final bool hasQuestions;
  final int totalAnswers;
  final int conformAnswers;
  final int nonConformAnswers;
  final num conformityRate;

  InspectionFormItem({
    required this.id,
    required this.organizationId,
    required this.label,
    required this.description,
    required this.periodicity,
    required this.domain,
    required this.inspectorIds,
    required this.responsibleIds,
    required this.processIds,
    required this.createdAt,
    required this.updatedAt,
    required this.revision,
    required this.version,
    required this.summary,
    required this.object,
    required this.partieRevisee,
    required this.printPath,
    required this.reference,
    required this.status,
    required this.hasSections,
    required this.hasQuestions,
    required this.totalAnswers,
    required this.conformAnswers,
    required this.nonConformAnswers,
    required this.conformityRate,
  });

  factory InspectionFormItem.fromJson(Map<String, dynamic> json) {
    List<int> toIntList(dynamic v) =>
        (v as List<dynamic>? ?? []).map((e) => (e as num).toInt()).toList();
    return InspectionFormItem(
      id: (json['id'] as num).toInt(),
      organizationId: (json['organization_id'] as num?)?.toInt() ?? 0,
      label: (json['label'] as String?) ?? '',
      description: json['description'] as String?,
      periodicity: (json['periodicity'] as String?) ?? '',
      domain: (json['domain'] as String?) ?? '',
      inspectorIds: toIntList(json['inspector_ids']),
      responsibleIds: toIntList(json['responsible_ids']),
      processIds: toIntList(json['process_ids']),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      revision: json['revision']?.toString(),
      version: json['version']?.toString(),
      summary: json['summary'] as String?,
      object: json['object'] as String?,
      partieRevisee: json['partie_revisee'] as String?,
      printPath: json['print'] as String?,
      reference: json['reference'] as String?,
      status: json['status'] as String?,
      hasSections: (json['has_sections'] as bool?) ?? false,
      hasQuestions: (json['has_questions'] as bool?) ?? false,
      totalAnswers: (json['total_answers'] as num?)?.toInt() ?? 0,
      conformAnswers: (json['conform_answers'] as num?)?.toInt() ?? 0,
      nonConformAnswers: (json['non_conform_answers'] as num?)?.toInt() ?? 0,
      conformityRate: (json['conformity_rate'] as num?) ?? 0,
    );
  }

  bool get canEdit =>
      status == 'draft' || status == 'published' || status == null;

  bool get canDelete => status == 'draft' || status == null;

  String get humanizedStatus => humanizeStatus(status);

  Color get statusColor => bgColor(status);
}
