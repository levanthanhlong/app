part of 'search_course_bloc.dart';

abstract class SearchCourseEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetSearchCourseEvent extends SearchCourseEvent {
  final String text;

  GetSearchCourseEvent(this.text);

  @override
  // TODO: implement props
  List<Object?> get props => [text];
}

