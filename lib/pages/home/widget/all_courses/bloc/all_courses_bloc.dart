import 'package:app/data/remote/apiService.dart';
import 'package:app/model/course.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'all_courses_event.dart';
part 'all_courses_state.dart';

class AllCoursesBloc extends Bloc<AllCoursesEvent, AllCoursesState> {
  AllCoursesBloc() : super(AllCoursesInitial()) {
    on<GetAllCoursesEvent>(onGetAllCourses);
  }
  final apiService = ApiService();

  Future<void> onGetAllCourses (GetAllCoursesEvent event, Emitter<AllCoursesState> emit) async {
    emit(AllCoursesLoading());
    final data = await apiService.getAllCourses();
    if(data["status"] == 0){
      emit(AllCoursesError(data["message"]));
    }else{
      final List<Course> listCourses = (data['totalCourse'] as List<dynamic>)
          .map((json) => Course.fromJson(json as Map<String, dynamic>))
          .toList();
      emit(GetAllCoursesSuccess(listCourses));
    }
  }
}
