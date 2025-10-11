class MyFormation {
  final int id; // enrollment/registration id
  final Formation formation;
  final String registrationType;
  final String? startDate;
  final String? endDate;
  final String status;
  final String? updatedAt;
  final String? createdAt;
  final int? currentLesson;
  final int? lessonsDone;
  final int totalLessonsDone;
  final int totalLessons;

  MyFormation({
    required this.id,
    required this.formation,
    required this.registrationType,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.updatedAt,
    required this.createdAt,
    required this.currentLesson,
    required this.lessonsDone,
    required this.totalLessonsDone,
    required this.totalLessons,
  });

  factory MyFormation.fromJson(Map<String, dynamic> json) => MyFormation(
    id: (json['id'] as num).toInt(),
    formation: Formation.fromJson(
      json['formation'] as Map<String, dynamic>? ?? <String, dynamic>{},
    ),
    registrationType: (json['registration_type'] as String?) ?? '',
    startDate: json['start_date'] as String?,
    endDate: json['end_date'] as String?,
    status: (json['status'] as String?) ?? '',
    updatedAt: json['updated_at'] as String?,
    createdAt: json['created_at'] as String?,
    currentLesson: (json['current_lesson'] as num?)?.toInt(),
    lessonsDone: (json['lessons_done'] as num?)?.toInt(),
    totalLessonsDone: (json['total_lessons_done'] as num?)?.toInt() ?? 0,
    totalLessons: (json['total_lessons'] as num?)?.toInt() ?? 0,
  );
}

class Formation {
  final int id;
  final String title;
  final String descriptionHtml;
  final String deliveryMode;
  final int trainerId;
  final int maxParticipants;
  final int durationMinutes;
  final bool certification;
  final List<String> learningOutcomes;
  final List<String> skillsToAcquire;
  final int organizationId;
  final int userId;
  final String image; // relative path
  final String status;
  final String? createdAt;
  final String? updatedAt;
  final String? imageUrl; // may be null per sample
  final List<Course> courses;

  Formation({
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
    required this.courses,
  });

  factory Formation.fromJson(Map<String, dynamic> json) => Formation(
    id: (json['id'] as num).toInt(),
    title: (json['title'] as String?) ?? '',
    descriptionHtml: (json['description'] as String?) ?? '',
    deliveryMode: (json['delivery_mode'] as String?) ?? '',
    trainerId: (json['trainer_id'] as num?)?.toInt() ?? 0,
    maxParticipants: (json['max_participants'] as num?)?.toInt() ?? 0,
    durationMinutes: (json['duration_minutes'] as num?)?.toInt() ?? 0,
    certification: json['certification'] == true,
    learningOutcomes: (json['learning_outcomes'] as List<dynamic>? ?? [])
        .map((e) => e.toString())
        .toList(),
    skillsToAcquire: (json['skills_to_acquire'] as List<dynamic>? ?? [])
        .map((e) => e.toString())
        .toList(),
    organizationId: (json['organization_id'] as num?)?.toInt() ?? 0,
    userId: (json['user_id'] as num?)?.toInt() ?? 0,
    image: (json['image'] as String?) ?? '',
    status: (json['status'] as String?) ?? '',
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
    imageUrl: json['image_url'] as String?,
    courses: (json['courses'] as List<dynamic>? ?? [])
        .whereType<Map<String, dynamic>>()
        .map(Course.fromJson)
        .toList(),
  );
}

class Course {
  final int id;
  final int formationId;
  final String title;
  final bool isPublic;
  final String descriptionHtml;
  final String media;
  final List<String> tags;
  final int order;
  final String? createdAt;
  final String? updatedAt;

  Course({
    required this.id,
    required this.formationId,
    required this.title,
    required this.isPublic,
    required this.descriptionHtml,
    required this.media,
    required this.tags,
    required this.order,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Course.fromJson(Map<String, dynamic> json) => Course(
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
    updatedAt: json['updated_at'] as String?,
  );
}
