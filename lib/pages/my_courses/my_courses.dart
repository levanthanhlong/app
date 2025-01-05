import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/course_card.dart';
import 'bloc/get_all_courses_bloc.dart';

class MyCourses extends StatelessWidget {
  static const routeName = 'myCourses';
  const MyCourses({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetAllCoursesBloc()..add(GetAllCoursesEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Courses'),
        ),
        body: BlocBuilder<GetAllCoursesBloc, GetAllCoursesState>(
          builder: (context, state) {
            if (state is GetAllCoursesLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetAllCoursesError) {
              return Center(child: Text(state.error));
            } else if (state is GetAllCoursesSuccess) {
              return ListView.builder(
                itemCount: state.courses.length,
                itemBuilder: (context, index) {
                  final course = state.courses[index];
                  return CourseCard(course: course);
                },
              );
            }
            return const Center(child: Text('No courses available.'));
          },
        ),
      ),
    );
  }
}
