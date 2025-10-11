class FormationItem {
  final int id;
  final String title;
  final String trainerName;
  final String image; // relative path or URL from new API
  final String deliveryMode;

  FormationItem({
    required this.id,
    required this.title,
    required this.trainerName,
    required this.image,
    required this.deliveryMode,
  });

  factory FormationItem.fromJson(Map<String, dynamic> json) => FormationItem(
    id: (json['id'] as num).toInt(),
    title: (json['title'] as String?) ?? '',
    // new API nests trainer name under trainer.name; keep old 'trainer_name' as fallback
    trainerName:
        (json['trainer_name'] as String?) ??
        ((json['trainer'] is Map<String, dynamic>)
            ? ((json['trainer'] as Map<String, dynamic>)['name'] as String?) ??
                  ''
            : ''),
    // new API uses image_url, older used image
    image: (json['image_url'] as String?) ?? (json['image'] as String?) ?? '',
    deliveryMode: (json['delivery_mode'] as String?) ?? '',
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'trainer_name': trainerName,
    'image': image,
    'delivery_mode': deliveryMode,
  };
}
