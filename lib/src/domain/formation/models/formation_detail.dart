class FormationDetail {
  final int id;
  final String title;
  final String status;
  final String descriptionHtml; // raw HTML
  final String deliveryMode;
  final String imageUrl;
  final Trainer trainer;
  final List<dynamic> sessions; // placeholder (structure inconnue)
  final int durationMinutes;
  final bool certification;
  final List<String> learningOutcomes;
  final List<String> skillsToAcquire;
  final int maxParticipants;
  final String? createdAt;
  final bool participating;

  FormationDetail({
    required this.id,
    required this.title,
    required this.status,
    required this.descriptionHtml,
    required this.deliveryMode,
    required this.imageUrl,
    required this.trainer,
    required this.sessions,
    required this.durationMinutes,
    required this.certification,
    required this.learningOutcomes,
    required this.skillsToAcquire,
    required this.maxParticipants,
    required this.createdAt,
    required this.participating,
  });

  factory FormationDetail.fromJson(Map<String, dynamic> json) =>
      FormationDetail(
        id: (json['id'] as num).toInt(),
        title: (json['title'] as String?) ?? '',
        status: (json['status'] as String?) ?? '',
        descriptionHtml: (json['description'] as String?) ?? '',
        deliveryMode: (json['delivery_mode'] as String?) ?? '',
        imageUrl: (json['image_url'] as String?) ?? '',
        trainer: Trainer.fromJson(
          json['trainer'] as Map<String, dynamic>? ?? {},
        ),
        sessions: json['sessions'] as List<dynamic>? ?? [],
        durationMinutes: (json['duration_minutes'] as num?)?.toInt() ?? 0,
        certification: json['certification'] == true,
        learningOutcomes: (json['learning_outcomes'] as List<dynamic>? ?? [])
            .map((e) => e.toString())
            .toList(),
        skillsToAcquire: (json['skills_to_acquire'] as List<dynamic>? ?? [])
            .map((e) => e.toString())
            .toList(),
        maxParticipants: (json['max_participants'] as num?)?.toInt() ?? 0,
        createdAt: json['created_at'] as String?,
        participating: json['participating'] == true,
      );
}

class Trainer {
  final int id;
  final String name;
  final String email;
  final String phone;
  final Institut? institut;

  Trainer({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.institut,
  });

  factory Trainer.fromJson(Map<String, dynamic> json) => Trainer(
    id: (json['id'] as num?)?.toInt() ?? 0,
    name: (json['name'] as String?) ?? '',
    email: (json['email'] as String?) ?? '',
    phone: (json['phone'] as String?) ?? '',
    institut: json['institut'] == null
        ? null
        : Institut.fromJson(json['institut'] as Map<String, dynamic>),
  );
}

class Institut {
  final int id;
  final String name;
  final String phone;
  final String email;
  final String? website;
  final String city;
  final String country;

  Institut({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.website,
    required this.city,
    required this.country,
  });

  factory Institut.fromJson(Map<String, dynamic> json) => Institut(
    id: (json['id'] as num?)?.toInt() ?? 0,
    name: (json['name'] as String?) ?? '',
    phone: (json['phone'] as String?) ?? '',
    email: (json['email'] as String?) ?? '',
    website: json['website'] as String?,
    city: (json['city'] as String?) ?? '',
    country: (json['country'] as String?) ?? '',
  );
}
