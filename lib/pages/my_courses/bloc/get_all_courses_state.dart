part of 'get_all_courses_bloc.dart';

abstract class GetAllCoursesState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetAllCoursesInitial extends GetAllCoursesState {}

class GetAllCoursesLoading extends GetAllCoursesState {}

class GetAllCoursesSuccess extends GetAllCoursesState {
  final List<Course> courses;

  GetAllCoursesSuccess(this.courses);

  @override
  // TODO: implement props
  List<Object?> get props => [courses];
}

class GetAllCoursesError extends GetAllCoursesState {
  final String error;

  GetAllCoursesError(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
