class InspectionCreateBody {
  final int inspectionFormId;
  final List<int> siteIds;
  final String mission;
  final List<int> inspectorIds;
  final String? description;

  InspectionCreateBody({
    required this.inspectionFormId,
    required this.siteIds,
    required this.mission,
    required this.inspectorIds,
    this.description,
  });

  Map<String, dynamic> toJson() => {
    'inspection_form_id': inspectionFormId,
    'site_ids': siteIds,
    'mission': mission,
    'inspector_ids': inspectorIds,
    if (description != null) 'description': description,
  };
}
