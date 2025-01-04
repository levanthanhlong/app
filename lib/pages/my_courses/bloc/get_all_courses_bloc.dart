import 'package:app/data/remote/apiService.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../model/course.dart';

part 'get_all_courses_event.dart';

part 'get_all_courses_state.dart';

class GetAllCoursesBloc extends Bloc<CoursesEvent, GetAllCoursesState> {
  final apiService = ApiService();

  GetAllCoursesBloc() : super(GetAllCoursesInitial()) {
    on<GetAllCoursesEvent>(onGetAllCourses);
  }

  Future<void> onGetAllCourses(
      GetAllCoursesEvent event, Emitter<GetAllCoursesState> emit) async {
    emit(GetAllCoursesLoading());
    final data = await apiService.getAllCourses();
    print(data);
    if (data["status"] == 0) {
      emit(GetAllCoursesError(data["message"]));
    } else {
      final List<Course> courses = (data['totalCourse'] as List<dynamic>)
          .map((json) => Course.fromJson(json as Map<String, dynamic>))
          .toList();
      emit(GetAllCoursesSuccess(courses));
    }
  }
}
