import 'package:app/model/course.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import '../../../courses/course_detail_page.dart';
import 'bloc/all_courses_bloc.dart';

class AllCoursesWidget extends StatelessWidget {
  const AllCoursesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AllCoursesBloc()..add(GetAllCoursesEvent()),
      child: BlocBuilder<AllCoursesBloc, AllCoursesState>(
        builder: (context, state) {
          if (state is AllCoursesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AllCoursesError) {
            return Center(child: Text('Error: ${state.error}'));
          } else if (state is GetAllCoursesSuccess) {
            List<Course> coursesData = state.listCourses;

            return SizedBox(
              height: 250,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: coursesData.length,
                itemBuilder: (BuildContext context, int index) {
                  return CourseTile(
                    id: coursesData[index].id,
                    courseDescribe: coursesData[index].courseDescribe,
                    courseName: coursesData[index].courseName,
                    category: coursesData[index].category ?? '',
                  );
                },
              ),
            );
          }
          return const Center(child: Text('No courses available.'));
        },
      ),
    );
  }
}

class CourseTile extends StatelessWidget {
  final int id;
  final String courseName;
  final String category;
  final String courseDescribe;

  CourseTile(
      {super.key,
      required this.courseName,
      required this.id,
      required this.courseDescribe,
      required this.category});

  void selectedCourse(BuildContext context) {
    Navigator.of(context).pushNamed(CourseDetailPage.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    String imageURL = (category == "vocabulary")
        ? "assets/images/vocab.png"
        : (category == "grammar")
            ? "assets/images/grammar.png"
            : "assets/images/default.png";
    return InkWell(
      onTap: (() => selectedCourse(context)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 8, right: 5),
              constraints: const BoxConstraints.expand(height: 150, width: 250),
              padding: const EdgeInsets.only(left: 16, bottom: 8, right: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(imageURL), fit: BoxFit.cover)),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 10,
                    child: Container(
                      height: 25,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.all(3),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              IconlyBold.unlock,
                              size: 15,
                              color: Colors.yellow[800],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Text(
                courseName,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.lightBlue),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
