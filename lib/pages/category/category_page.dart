import 'package:app/pages/category/bloc/category_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/course_card.dart';

class CategoryPage extends StatelessWidget {
  static const routeName = '/categoryPage';
  final String category;

  const CategoryPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoryBloc()..add(GetCategoryCoursesEvent(category)),
      child: Scaffold(
        appBar: AppBar(
          title: Text('List of $category'),
        ),
        body: BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            if (state is CategoryLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CategoryError) {
              return Center(child: Text(state.error));
            } else if (state is GetCategoryCoursesSuccess) {
              return ListView.builder(
                itemCount: state.categoryCourses.length,
                itemBuilder: (context, index) {
                  final course = state.categoryCourses[index];
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
