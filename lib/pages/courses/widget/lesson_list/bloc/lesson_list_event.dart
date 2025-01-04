part of 'lesson_list_bloc.dart';

abstract class LessonListEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetLessonListEvent extends LessonListEvent {
  final int courseId;

  GetLessonListEvent(this.courseId);
  @override
  // TODO: implement props
  List<Object?> get props => [courseId];
}
