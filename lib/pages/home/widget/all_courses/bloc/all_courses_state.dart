part of 'all_courses_bloc.dart';

abstract class AllCoursesState extends Equatable {
  @override
  List<Object> get props => [];
}

class AllCoursesInitial extends AllCoursesState {}

class AllCoursesError extends AllCoursesState {
  final String error;

  AllCoursesError(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}

class AllCoursesLoading extends AllCoursesState {}

class GetAllCoursesSuccess extends AllCoursesState {
  final List<Course> listCourses;

  GetAllCoursesSuccess(this.listCourses);

  @override
  // TODO: implement props
  List<Object> get props => [listCourses];
}
