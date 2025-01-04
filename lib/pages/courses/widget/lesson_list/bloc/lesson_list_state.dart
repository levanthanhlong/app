part of 'lesson_list_bloc.dart';

abstract class LessonListState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LessonListInitial extends LessonListState {}

class LessonListLoading extends LessonListState {}

class GetLessonListSuccess extends LessonListState {
  final List<Lesson> lessons;
  GetLessonListSuccess(this.lessons);

  @override
  // TODO: implement props
  List<Object?> get props => [lessons];
}

class LessonListError extends LessonListState {
  final String error;

  LessonListError(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
