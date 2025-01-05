part of 'search_course_bloc.dart';

abstract class SearchCourseState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SearchCourseInitial extends SearchCourseState {}

class SearchCourseError extends SearchCourseState {
  final String error;

  SearchCourseError(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}

class SearchCourseLoading extends SearchCourseState {}

class GetSearchCourseSuccess extends SearchCourseState {
  final List<Course> searchCourses;

  GetSearchCourseSuccess(this.searchCourses);

  @override
  // TODO: implement props
  List<Object?> get props => [searchCourses];
}
