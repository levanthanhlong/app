import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

import '../../model/course.dart';

import 'bloc/get_detail_course_bloc.dart';
import 'widget/lesson_list/lesson_list_widget.dart';

class CourseDetailPage extends StatelessWidget {
  static const routeName = "/course_detail_page";

  const CourseDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final courseID = ModalRoute.of(context)!.settings.arguments as int;
    print('======== $courseID');

    return BlocProvider(
      create: (context) =>
          GetDetailCourseBloc()..add(GetDetailCourseEvent(courseID)),
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.grey[100],
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              IconlyLight.arrow_left,
              size: 26,
              color: Colors.black,
            ),
            style: IconButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: Colors.white,
            ),
          ),
          title: const Text(
            "Course Details",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
        ),
        body: BlocBuilder<GetDetailCourseBloc, DetailCourseState>(
          builder: (context, state) {
            if (state is GetDetailCourseLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetDetailCourseError) {
              return Center(
                child: Text(
                  state.error,
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                ),
              );
            } else if (state is RegisterCourseSuccess) {
              // Hiển thị thông báo thành công
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Course registered successfully!')),
                );
                context
                    .read<GetDetailCourseBloc>()
                    .add(GetDetailCourseEvent(courseID));
              });
            } else if (state is GetDetailCourseSuccess) {
              final course = state.course;
              return Column(
                children: [
                  buildCourseDetailContent(context, course, state.enable),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget buildCourseDetailContent(
      BuildContext context, Course course, bool enable) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        children: [
          courseImage(course),
          const SizedBox(height: 10),
          Text(
            course.courseName,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'About Course',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            course.courseDescribe,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
          const SizedBox(height: 10),
          if (enable)
            const Text(
              'Lessons',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          const SizedBox(height: 5),
          if (enable) LessonListWidget(courseId: course.id),

          const SizedBox(height: 90),
          // Nút đăng ký khóa học
          if (!enable)
            ElevatedButton(
              onPressed: () {
                context
                    .read<GetDetailCourseBloc>()
                    .add(RegisterCourseEvent(course.id));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.grey,
                maximumSize: const Size(70, 50),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(12), // Bo tròn các góc của nút
                ),
              ),
              child: const Text('Register'),
            ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Container courseImage(Course course) {
    String imageURL = (course.category == "vocabulary")
        ? "assets/images/vocab.png"
        : (course.category == "grammar")
            ? "assets/images/grammar.png"
            : "assets/images/default.png";
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 8),
      constraints: const BoxConstraints.expand(height: 230),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
          image: AssetImage(imageURL),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.2),
            BlendMode.colorBurn,
          ),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.6),
            radius: 50,
          ),
          const Icon(
            IconlyBold.play,
            color: Colors.red,
            size: 90,
          ),
        ],
      ),
    );
  }
}
