import 'inspection_detail.dart'
    show InspectionUser, InspectionSectionWithQuestions;

class InspectionZoneLite {
  final int id;
  final String label;
  InspectionZoneLite({required this.id, required this.label});
  factory InspectionZoneLite.fromJson(Map<String, dynamic> json) =>
      InspectionZoneLite(
        id: (json['id'] as num).toInt(),
        label: (json['label'] as String?) ?? '',
      );
}

class InspectionEquipmentLite {
  final int id;
  final String label;
  InspectionEquipmentLite({required this.id, required this.label});
  factory InspectionEquipmentLite.fromJson(Map<String, dynamic> json) =>
      InspectionEquipmentLite(
        id: (json['id'] as num).toInt(),
        label: (json['label'] as String?) ?? '',
      );
}

class InspectionProcessLite {
  final int id;
  final String title;
  final String? description;
  final String? type;
  final int? organizationId;
  InspectionProcessLite({
    required this.id,
    required this.title,
    this.description,
    this.type,
    this.organizationId,
  });
  factory InspectionProcessLite.fromJson(Map<String, dynamic> json) =>
      InspectionProcessLite(
        id: (json['id'] as num).toInt(),
        title: (json['title'] as String?) ?? '',
        description: json['description'] as String?,
        type: json['type'] as String?,
        organizationId: (json['organization_id'] as num?)?.toInt(),
      );
}

class InspectionFormStats {
  final int totalInspections;
  final int completedInspections;
  final int inProgressInspections;
  final int totalQuestions;
  final int totalSections;
  final String? lastInspectionDate;
  final String? nextInspectionDate;
  final int zonesCount;
  final int equipmentCount;
  final int totalNonConformities;
  InspectionFormStats({
    required this.totalInspections,
    required this.completedInspections,
    required this.inProgressInspections,
    required this.totalQuestions,
    required this.totalSections,
    required this.lastInspectionDate,
    required this.nextInspectionDate,
    required this.zonesCount,
    required this.equipmentCount,
    required this.totalNonConformities,
  });
  factory InspectionFormStats.fromJson(Map<String, dynamic> json) =>
      InspectionFormStats(
        totalInspections: (json['total_inspections'] as num?)?.toInt() ?? 0,
        completedInspections:
            (json['completed_inspections'] as num?)?.toInt() ?? 0,
        inProgressInspections:
            (json['in_progress_inspections'] as num?)?.toInt() ?? 0,
        totalQuestions: (json['total_questions'] as num?)?.toInt() ?? 0,
        totalSections: (json['total_sections'] as num?)?.toInt() ?? 0,
        lastInspectionDate: json['last_inspection_date'] as String?,
        nextInspectionDate: json['next_inspection_date'] as String?,
        zonesCount: (json['zones_count'] as num?)?.toInt() ?? 0,
        equipmentCount: (json['equipment_count'] as num?)?.toInt() ?? 0,
        totalNonConformities:
            (json['total_non_conformities'] as num?)?.toInt() ?? 0,
      );
}

class InspectionListMeta {
  final int id;
  final int organizationId;
  final String? revision;
  final String? version;
  final String? summary;
  final String? object;
  final String? partieRevisee;
  final String? printPath;
  final String? reference;
  final String status;
  final String listType;
  final String? createdAt;
  final String? updatedAt;
  InspectionListMeta({
    required this.id,
    required this.organizationId,
    required this.revision,
    required this.version,
    required this.summary,
    required this.object,
    required this.partieRevisee,
    required this.printPath,
    required this.reference,
    required this.status,
    required this.listType,
    required this.createdAt,
    required this.updatedAt,
  });
  factory InspectionListMeta.fromJson(Map<String, dynamic> json) =>
      InspectionListMeta(
        id: (json['id'] as num).toInt(),
        organizationId: (json['organization_id'] as num?)?.toInt() ?? 0,
        revision: json['revision']?.toString(),
        version: json['version']?.toString(),
        summary: json['summary'] as String?,
        object: json['object'] as String?,
        partieRevisee: json['partie_revisee'] as String?,
        printPath: json['print'] as String?,
        reference: json['reference'] as String?,
        status: (json['status'] as String?) ?? '',
        listType: (json['list_type'] as String?) ?? '',
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
      );
}

class InspectionFormDetail {
  final int id;
  final String label;
  final String? description;
  final String periodicity;
  final String domain;
  final int organizationId;
  final String? status;
  final String? revision;
  final String? version;
  final String? summary;
  final String? object;
  final String? partieRevisee;
  final String? printPath;
  final String? reference;
  final String? createdAt;
  final String? updatedAt;
  final List<InspectionUser> inspectors;
  final List<InspectionUser> responsibles;
  final List<InspectionZoneLite> zones;
  final List<InspectionEquipmentLite> equipment;
  final List<InspectionProcessLite> processes;
  final List<InspectionSectionWithQuestions> sections;
  final InspectionFormStats? statistics;
  final InspectionListMeta? listMeta;

  InspectionFormDetail({
    required this.id,
    required this.label,
    required this.description,
    required this.periodicity,
    required this.domain,
    required this.organizationId,
    required this.status,
    required this.revision,
    required this.version,
    required this.summary,
    required this.object,
    required this.partieRevisee,
    required this.printPath,
    required this.reference,
    required this.createdAt,
    required this.updatedAt,
    required this.inspectors,
    required this.responsibles,
    required this.zones,
    required this.equipment,
    required this.processes,
    required this.sections,
    required this.statistics,
    required this.listMeta,
  });

  factory InspectionFormDetail.fromJson(Map<String, dynamic> json) {
    List<T> mapList<T>(dynamic v, T Function(Map<String, dynamic>) from) =>
        (v as List<dynamic>? ?? [])
            .whereType<Map<String, dynamic>>()
            .map(from)
            .toList();

    return InspectionFormDetail(
      id: (json['id'] as num).toInt(),
      label: (json['label'] as String?) ?? '',
      description: json['description'] as String?,
      periodicity: (json['periodicity'] as String?) ?? '',
      domain: (json['domain'] as String?) ?? '',
      organizationId: (json['organization_id'] as num?)?.toInt() ?? 0,
      status: json['status'] as String?,
      revision: json['revision']?.toString(),
      version: json['version']?.toString(),
      summary: json['summary'] as String?,
      object: json['object'] as String?,
      partieRevisee: json['partie_revisee'] as String?,
      printPath: json['print'] as String?,
      reference: json['reference'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      inspectors: mapList(json['inspectors'], InspectionUser.fromJson),
      responsibles: mapList(json['responsibles'], InspectionUser.fromJson),
      zones: mapList(json['zones'], InspectionZoneLite.fromJson),
      equipment: mapList(json['equipment'], InspectionEquipmentLite.fromJson),
      processes: mapList(json['processes'], InspectionProcessLite.fromJson),
      sections: mapList(
        json['sections'],
        InspectionSectionWithQuestions.fromJson,
      ),
      statistics: (json['statistics'] is Map<String, dynamic>)
          ? InspectionFormStats.fromJson(
              json['statistics'] as Map<String, dynamic>,
            )
          : null,
      listMeta: (json['list'] is Map<String, dynamic>)
          ? InspectionListMeta.fromJson(json['list'] as Map<String, dynamic>)
          : null,
    );
  }
}
