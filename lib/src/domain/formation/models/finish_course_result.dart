class FinishCourseResult {
  final int registrationId;
  final int currentLesson;
  final List<int> lessonsDone;

  FinishCourseResult({
    required this.registrationId,
    required this.currentLesson,
    required this.lessonsDone,
  });

  factory FinishCourseResult.fromJson(Map<String, dynamic> json) =>
      FinishCourseResult(
        registrationId: (json['registration_id'] as num?)?.toInt() ?? 0,
        currentLesson: (json['current_lesson'] as num?)?.toInt() ?? 0,
        lessonsDone: (json['lessons_done'] as List<dynamic>? ?? [])
            .map((e) => (e as num).toInt())
            .toList(),
      );
}
