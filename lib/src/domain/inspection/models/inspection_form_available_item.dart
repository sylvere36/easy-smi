class InspectionFormAvailableItem {
  final int id;
  final String label;
  final int? ongoingInspectionId;

  InspectionFormAvailableItem({
    required this.id,
    required this.label,
    required this.ongoingInspectionId,
  });

  factory InspectionFormAvailableItem.fromJson(Map<String, dynamic> json) {
    return InspectionFormAvailableItem(
      id: (json['id'] as num?)?.toInt() ?? 0,
      label: (json['label'] as String?) ?? '',
      ongoingInspectionId: (json['ongoing_inspection_id'] as num?)?.toInt(),
    );
  }
}
