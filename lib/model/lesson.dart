class Lesson {
  final int id;
  final int courseId;
  final String lessonDescribe;
  final String videoUrl;
  final DateTime createdAt;

  Lesson({
    required this.id,
    required this.courseId,
    required this.lessonDescribe,
    required this.videoUrl,
    required this.createdAt,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['id'],
      courseId: json['course_id'],
      lessonDescribe: json['lesson_describe'],
      videoUrl: json['video_url'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'course_id': courseId,
      'lesson_describe': lessonDescribe,
      'video_url': videoUrl,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
