class StartCourseResult {
  final int registrationId;
  final int currentLesson;

  StartCourseResult({
    required this.registrationId,
    required this.currentLesson,
  });

  factory StartCourseResult.fromJson(Map<String, dynamic> json) =>
      StartCourseResult(
        registrationId: (json['registration_id'] as num?)?.toInt() ?? 0,
        currentLesson: (json['current_lesson'] as num?)?.toInt() ?? 0,
      );
}
