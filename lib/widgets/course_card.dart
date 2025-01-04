import 'package:flutter/material.dart';

import '../model/course.dart';
import '../pages/courses/course_detail_page.dart';

class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard({Key? key, required this.course}) : super(key: key);
  void selectedCourse(BuildContext context) {
    print('---------------- ${course.id}');
    Navigator.of(context).pushNamed(CourseDetailPage.routeName, arguments: course.id);
  }
  String getImageForCategory(String? category) {
    switch (category) {
      case "vocabulary":
        return 'assets/images/vocab.png';
      case "grammar":
        return 'assets/images/grammar.png';
      default:
        return 'assets/images/default.png'; // Hình ảnh mặc định nếu không khớp
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Image.asset(
          getImageForCategory(course.category),
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(
          course.courseName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(course.courseDescribe, maxLines: 2, overflow: TextOverflow.ellipsis),
        onTap: () {
          selectedCourse(context);
        },
      ),
    );
  }
}
