class SliderItem {
  final int id;
  final String image;
  final String type;
  final int? formationId;
  final int? campaignId;
  final int organizationId;
  final int userId;
  final bool isActive;
  final String? createdAt;
  final String? updatedAt;
  final SliderFormation? formation;

  SliderItem({
    required this.id,
    required this.image,
    required this.type,
    required this.formationId,
    required this.campaignId,
    required this.organizationId,
    required this.userId,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.formation,
  });

  factory SliderItem.fromJson(Map<String, dynamic> json) => SliderItem(
    id: (json['id'] as num).toInt(),
    image: (json['image'] as String?) ?? '',
    type: (json['type'] as String?) ?? '',
    formationId: (json['formation_id'] as num?)?.toInt(),
    campaignId: (json['campaign_id'] as num?)?.toInt(),
    organizationId: (json['organization_id'] as num?)?.toInt() ?? 0,
    userId: (json['user_id'] as num?)?.toInt() ?? 0,
    isActive: (json['is_active'] == 1) || (json['is_active'] == true),
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
    formation: (json['formation'] is Map<String, dynamic>)
        ? SliderFormation.fromJson(json['formation'] as Map<String, dynamic>)
        : null,
  );
}

class SliderFormation {
  final int id;
  final String title;
  final String? descriptionHtml;
  final String? deliveryMode;
  final int? trainerId;
  final int? maxParticipants;
  final int? durationMinutes;
  final bool certification;
  final List<String> learningOutcomes;
  final List<String> skillsToAcquire;
  final int? organizationId;
  final int? userId;
  final String image;
  final String status;
  final String? createdAt;
  final String? updatedAt;
  final String? imageUrl;

  SliderFormation({
    required this.id,
    required this.title,
    required this.descriptionHtml,
    required this.deliveryMode,
    required this.trainerId,
    required this.maxParticipants,
    required this.durationMinutes,
    required this.certification,
    required this.learningOutcomes,
    required this.skillsToAcquire,
    required this.organizationId,
    required this.userId,
    required this.image,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.imageUrl,
  });

  factory SliderFormation.fromJson(Map<String, dynamic> json) =>
      SliderFormation(
        id: (json['id'] as num).toInt(),
        title: (json['title'] as String?) ?? '',
        descriptionHtml: json['description'] as String?,
        deliveryMode: json['delivery_mode'] as String?,
        trainerId: (json['trainer_id'] as num?)?.toInt(),
        maxParticipants: (json['max_participants'] as num?)?.toInt(),
        durationMinutes: (json['duration_minutes'] as num?)?.toInt(),
        certification: json['certification'] == true,
        learningOutcomes: (json['learning_outcomes'] as List<dynamic>? ?? [])
            .map((e) => e.toString())
            .toList(),
        skillsToAcquire: (json['skills_to_acquire'] as List<dynamic>? ?? [])
            .map((e) => e.toString())
            .toList(),
        organizationId: (json['organization_id'] as num?)?.toInt(),
        userId: (json['user_id'] as num?)?.toInt(),
        image: (json['image'] as String?) ?? '',
        status: (json['status'] as String?) ?? '',
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
        imageUrl: json['image_url'] as String?,
      );
}
