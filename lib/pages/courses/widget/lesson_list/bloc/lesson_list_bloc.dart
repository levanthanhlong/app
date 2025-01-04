import 'package:app/data/remote/apiService.dart';
import 'package:app/model/lesson.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'lesson_list_event.dart';

part 'lesson_list_state.dart';

class LessonListBloc extends Bloc<LessonListEvent, LessonListState> {
  LessonListBloc() : super(LessonListInitial()) {
    on<GetLessonListEvent>(onGetLessonList);
  }

  final apiService = ApiService();

  Future<void> onGetLessonList(
      GetLessonListEvent event, Emitter<LessonListState> emit) async {
    emit(LessonListLoading());
    final data = await apiService.getAllLessonInCourse(event.courseId);
    if (data["status"] == 0) {
      emit(LessonListError(data["message"]));
    } else {
      final List<Lesson> lessons = (data['listLesson'] as List<dynamic>)
          .map((json) => Lesson.fromJson(json as Map<String, dynamic>))
          .toList();
      emit(GetLessonListSuccess(lessons));
    }
  }
}
