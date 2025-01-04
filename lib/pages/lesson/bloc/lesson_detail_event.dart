part of 'lesson_detail_bloc.dart';

abstract class LessonDetailEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetLessonDetailEvent extends LessonDetailEvent {
  final int lessonId;

  GetLessonDetailEvent(this.lessonId);

  @override
  // TODO: implement props
  List<Object?> get props => [lessonId];
}
