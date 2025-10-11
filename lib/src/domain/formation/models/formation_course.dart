class FormationCourse {
  final int id;
  final int formationId;
  final String title;
  final bool isPublic;
  final String descriptionHtml;
  final String media;
  final List<String> tags;
  final int order;
  final String? createdAt;

  FormationCourse({
    required this.id,
    required this.formationId,
    required this.title,
    required this.isPublic,
    required this.descriptionHtml,
    required this.media,
    required this.tags,
    required this.order,
    required this.createdAt,
  });

  factory FormationCourse.fromJson(Map<String, dynamic> json) =>
      FormationCourse(
        id: (json['id'] as num).toInt(),
        formationId: (json['formation_id'] as num?)?.toInt() ?? 0,
        title: (json['title'] as String?) ?? '',
        isPublic: json['is_public'] == true,
        descriptionHtml: (json['description'] as String?) ?? '',
        media: (json['media'] as String?) ?? '',
        tags: (json['tags'] as List<dynamic>? ?? [])
            .map((e) => e.toString())
            .toList(),
        order: (json['order'] as num?)?.toInt() ?? 0,
        createdAt: json['created_at'] as String?,
      );
}
