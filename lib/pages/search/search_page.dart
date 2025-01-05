import 'package:app/pages/search/bloc/search_course_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/course_card.dart';

class SearchPage extends StatelessWidget {
  static const routeName = '/searchPage';
  final String text;

  const SearchPage({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCourseBloc()..add(GetSearchCourseEvent(text)),
      child: Scaffold(
        appBar: AppBar(
          title: Text('List of courses has $text'),
        ),
        body: BlocBuilder<SearchCourseBloc, SearchCourseState>(
          builder: (context, state) {
            if (state is SearchCourseLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SearchCourseError) {
              return Center(child: Text(state.error));
            } else if (state is GetSearchCourseSuccess) {
              return ListView.builder(
                itemCount: state.searchCourses.length,
                itemBuilder: (context, index) {
                  final course = state.searchCourses[index];
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
