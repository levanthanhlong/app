part of 'get_detail_course_bloc.dart';

abstract class DetailCourseState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DetailCourseInitial extends DetailCourseState {}

class GetDetailCourseSuccess extends DetailCourseState {
  final bool enable;
  final Course course;

  GetDetailCourseSuccess(this.course, this.enable);

  @override
  // TODO: implement props
  List<Object?> get props => [course];
}

class GetDetailCourseLoading extends DetailCourseState {}

class GetDetailCourseError extends DetailCourseState {
  final String error;

  GetDetailCourseError(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}

class RegisterCourseLoading extends DetailCourseState {}

class RegisterCourseSuccess extends DetailCourseState {}

class RegisterCourseError extends DetailCourseState {
  final String error;

  RegisterCourseError(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
