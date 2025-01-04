import 'package:app/data/remote/apiService.dart';
import 'package:app/model/course.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'new_courses_event.dart';
part 'new_courses_state.dart';

class NewCoursesBloc extends Bloc<NewCoursesEvent, NewCoursesState> {
  NewCoursesBloc() : super(NewCoursesInitial()) {
    on<GetNewCoursesEvent> (onGetNewCourses);
  }
  final apiService = ApiService();
  Future<void> onGetNewCourses (GetNewCoursesEvent event, Emitter<NewCoursesState> emit) async {
    emit(NewCoursesLoading());
    final data = await apiService.getNewCourses();
    if(data["status"] == 0) {
      emit(NewCoursesError(data["message"]));
    }else{
      final List<Course> newCourses = (data['newCourses'] as List<dynamic>)
          .map((json) => Course.fromJson(json as Map<String, dynamic>))
          .toList();
      emit(GetNewCoursesSuccess(newCourses));
    }
  }
}
