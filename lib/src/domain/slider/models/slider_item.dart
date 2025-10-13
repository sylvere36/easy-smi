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
  final SliderCampaign? campaign;

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
    required this.campaign,
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
    campaign: (json['campaign'] is Map<String, dynamic>)
        ? SliderCampaign.fromJson(json['campaign'] as Map<String, dynamic>)
        : null,
  );

  String get titleFromType {
    switch (type) {
      case 'formation':
        return 'Formation';
      case 'campaign':
        return 'Campagne';
      default:
        return '';
    }
  }

  String get subtitleFromType {
    switch (type) {
      case 'formation':
        return formation?.title ?? '';
      case 'campaign':
        return campaign?.title ?? '';
      default:
        return '';
    }
  }
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

class SliderCampaign {
  final int id;
  final String? coverImage;
  final int? organizationId;
  final String title;
  final String? description;
  final String? message;
  final String? startDate;
  final String? endDate;
  final String? readReceipt;
  final String? createdAt;
  final String? updatedAt;
  final String? communicationType;
  final String? smartObjective;
  final String? revision;
  final String? version;
  final String? summary;
  final String? object;
  final String? partieRevisee;
  final String? print;
  final String? reference;
  final String? status;
  final String? etat;

  SliderCampaign({
    required this.id,
    required this.coverImage,
    required this.organizationId,
    required this.title,
    required this.description,
    required this.message,
    required this.startDate,
    required this.endDate,
    required this.readReceipt,
    required this.createdAt,
    required this.updatedAt,
    required this.communicationType,
    required this.smartObjective,
    required this.revision,
    required this.version,
    required this.summary,
    required this.object,
    required this.partieRevisee,
    required this.print,
    required this.reference,
    required this.status,
    required this.etat,
  });

  factory SliderCampaign.fromJson(Map<String, dynamic> json) => SliderCampaign(
    id: (json['id'] as num).toInt(),
    coverImage: json['cover_image'] as String?,
    organizationId: (json['organization_id'] as num?)?.toInt(),
    title: (json['title'] as String?) ?? '',
    description: json['description'] as String?,
    message: json['message'] as String?,
    startDate: json['start_date'] as String?,
    endDate: json['end_date'] as String?,
    readReceipt: json['read_receipt'] as String?,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
    communicationType: json['communication_type'] as String?,
    smartObjective: json['smart_objective'] as String?,
    revision: json['revision'] as String?,
    version: json['version'] as String?,
    summary: json['summary'] as String?,
    object: json['object'] as String?,
    partieRevisee: json['partie_revisee'] as String?,
    print: json['print'] as String?,
    reference: json['reference'] as String?,
    status: json['status'] as String?,
    etat: json['etat'] as String?,
  );
}
