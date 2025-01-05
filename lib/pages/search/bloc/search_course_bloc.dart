import 'package:app/data/remote/apiService.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../model/course.dart';

part 'search_course_event.dart';

part 'search_course_state.dart';

class SearchCourseBloc extends Bloc<SearchCourseEvent, SearchCourseState> {
  SearchCourseBloc() : super(SearchCourseInitial()) {
    on<GetSearchCourseEvent>(onGetSearchCourse);
  }

  final apiService = ApiService();

  Future<void> onGetSearchCourse(
      GetSearchCourseEvent event, Emitter<SearchCourseState> emit) async {
    emit(SearchCourseLoading());
    final data = await apiService.getSearchCourses(event.text);
    if (data["status"] == 0) {
      emit(SearchCourseError(data["message"]));
    } else {
      final List<Course> searchCourses =
          (data['listSearchCourse'] as List<dynamic>)
              .map((json) => Course.fromJson(json as Map<String, dynamic>))
              .toList();
      emit(GetSearchCourseSuccess(searchCourses));
    }
  }
}
