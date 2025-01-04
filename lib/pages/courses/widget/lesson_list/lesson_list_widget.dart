import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

import '../../../lesson/lesson_page.dart';
import 'bloc/lesson_list_bloc.dart';

class LessonListWidget extends StatelessWidget {
  final int courseId;

  const LessonListWidget({super.key, required this.courseId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LessonListBloc()..add(GetLessonListEvent(courseId)),
      child: BlocBuilder<LessonListBloc, LessonListState>(
        builder: (context, state) {
          if (state is LessonListLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LessonListError) {
            return Center(
              child: Text(
                state.error,
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else if (state is GetLessonListSuccess) {
            final lessons = state.lessons;
            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: lessons.length,
              itemBuilder: (BuildContext context, int index) {
                final lesson = lessons[index];
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade100,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),
                  child: ListTile(
                    onTap: () => Navigator.of(context).pushNamed(
                      LessonPage.routeName,
                      arguments: lesson.id,
                    ),
                    leading: const Icon(
                      IconlyLight.play,
                      size: 50,
                      color: Colors.grey,
                    ),
                    title: Text(
                      lesson.lessonDescribe,
                      style: const TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ),
                );
              },
            );
          }
          return const SizedBox.shrink(); // Trạng thái mặc định.
        },
      ),
    );
  }
}
