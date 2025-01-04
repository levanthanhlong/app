// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'package:app/model/course.dart';
// import '../courses/course_detail_page.dart';
// import 'bloc/category_bloc.dart';
//
// class CategoryPage extends StatelessWidget {
//   static const routeName = '/categoryPage';
//   final String category;
//
//   const CategoryPage({super.key, required this.category});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => CategoryBloc()..add(GetCategoryCoursesEvent(category)),
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('List of $category'),
//         ),
//         body: BlocBuilder<CategoryBloc, CategoryState>(
//           builder: (context, state) {
//             if (state is CategoryLoading) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (state is CategoryError) {
//               return Center(child: Text('Error: ${state.error}'));
//             } else if (state is GetCategoryCoursesSuccess) {
//               final courses = state.categoryCourses;
//               return ListView.builder(
//                 itemCount: courses.length,
//                 itemBuilder: (context, index) {
//                   final course = courses[index];
//                   return CourseItemList(
//                     id: course.id,
//                     category: course.category ?? '',
//                     title: course.courseName,
//                   );
//                 },
//               );
//             } else {
//               return const Center(child: Text('No data available'));
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
//
// class CourseItemList extends StatelessWidget {
//   final int id;
//   final String category;
//   final String title;
//
//   const CourseItemList({
//     super.key,
//     required this.id,
//     required this.category,
//     required this.title,
//   });
//
//   void selectedCourse(BuildContext context) {
//     Navigator.of(context).pushNamed(CourseDetailPage.routeName, arguments: id);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     String imageURL = (category == "vocabulary")
//         ? "assets/images/vocab.png"
//         : (category == "grammar")
//         ? "assets/images/grammar.png"
//         : "assets/images/default.png";
//     return InkWell(
//       onTap: () => selectedCourse(context),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 5),
//         child: ListView(
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           children: [
//             Container(
//               margin: const EdgeInsets.only(top: 10, bottom: 8, right: 5),
//               constraints: const BoxConstraints.expand(height: 150, width: 250),
//               padding: const EdgeInsets.only(left: 16, bottom: 8, right: 16),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 image: DecorationImage(
//                   image: AssetImage(imageURL),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Center(
//               child: Text(
//                 title,
//                 style: const TextStyle(fontSize: 16),
//               ),
//             ),
//             const SizedBox(height: 5),
//           ],
//         ),
//       ),
//     );
//   }
// }

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
