part of 'new_courses_bloc.dart';

abstract class NewCoursesState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NewCoursesInitial extends NewCoursesState {}

class NewCoursesError extends NewCoursesState {
  final String error;

  NewCoursesError(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NewCoursesLoading extends NewCoursesState {}

class GetNewCoursesSuccess extends NewCoursesState {
  final List<Course> newCourses;

  GetNewCoursesSuccess(this.newCourses);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
