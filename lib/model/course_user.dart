class CourseUser {
  final int courseId;
  final int userId;

  CourseUser({required this.courseId, required this.userId});

  factory CourseUser.fromJson(Map<String, dynamic> json) {
    return CourseUser(
      courseId: json['course_id'],
      userId: json['user_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'course_id': courseId,
      'user_id': userId,
    };
  }
}
