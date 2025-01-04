part of 'question_bloc.dart';

abstract class QuestionEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetQuestionListEvent extends QuestionEvent {
  final int lessonId;

  GetQuestionListEvent(this.lessonId);

  @override
  // TODO: implement props
  List<Object?> get props => [lessonId];
}
