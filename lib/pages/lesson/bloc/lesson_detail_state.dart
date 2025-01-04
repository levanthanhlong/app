part of 'lesson_detail_bloc.dart';

abstract class LessonDetailState extends Equatable {
  @override
  List<Object> get props => [];
}

class LessonDetailInitial extends LessonDetailState {}

class LessonDetailLoading extends LessonDetailState {}

class LessonDetailError extends LessonDetailState {
  final String error;

  LessonDetailError(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}

class GetLessonDetailSuccess extends LessonDetailState {
  final Lesson lesson;

  GetLessonDetailSuccess(this.lesson);

  @override
  // TODO: implement props
  List<Object> get props => [lesson];
}
