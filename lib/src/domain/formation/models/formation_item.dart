class FormationItem {
  final int id;
  final String title;
  final String trainerName;
  final String image; // relative path
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
    trainerName: (json['trainer_name'] as String?) ?? '',
    image: (json['image'] as String?) ?? '',
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
