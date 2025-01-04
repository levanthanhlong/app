class Course {
  final int id;
  final String courseName;
  final String courseDescribe;
  final String? category;
  final DateTime createdAt;

  Course({
    required this.id,
    required this.courseName,
    required this.courseDescribe,
    this.category,
    required this.createdAt,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      courseName: json['course_name'],
      courseDescribe: json['course_describe'],
      category: json['category'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'course_name': courseName,
      'course_describe': courseDescribe,
      'category': category,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
