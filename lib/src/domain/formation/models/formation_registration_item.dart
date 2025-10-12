class FormationRegistrationItem {
  final int id;
  final String title;
  final String date; // ISO yyyy-MM-dd as per sample

  FormationRegistrationItem({
    required this.id,
    required this.title,
    required this.date,
  });

  factory FormationRegistrationItem.fromJson(Map<String, dynamic> json) =>
      FormationRegistrationItem(
        id: (json['id'] as num?)?.toInt() ?? 0,
        title: (json['title'] as String?) ?? '',
        date: (json['date'] as String?) ?? '',
      );
}
