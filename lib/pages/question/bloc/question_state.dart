part of 'question_bloc.dart';

abstract class QuestionState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class QuestionInitial extends QuestionState {}

class QuestionLoading extends QuestionState {}

class QuestionError extends QuestionState {
  final String error;

  QuestionError(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}

class GetQuestionSuccess extends QuestionState {
  final List<LessonQuestion> listQuestion;

  GetQuestionSuccess(this.listQuestion);

  @override
  // TODO: implement props
  List<Object?> get props => [listQuestion];
}
