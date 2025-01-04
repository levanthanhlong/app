import 'package:app/data/remote/apiService.dart';
import 'package:app/utls/use_token.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../model/course.dart';

part 'get_detail_course_event.dart';

part 'get_detail_course_state.dart';

class GetDetailCourseBloc extends Bloc<DetailCourseEvent, DetailCourseState> {
  final apiService = ApiService();
  var token = getToken();

  GetDetailCourseBloc() : super(DetailCourseInitial()) {
    on<GetDetailCourseEvent>(onGetDetailCourse);
    on<RegisterCourseEvent>(onRegisterCourse);
  }

  Future<void> onGetDetailCourse(
      GetDetailCourseEvent event, Emitter<DetailCourseState> emit) async {
    emit(GetDetailCourseLoading());
    var token = await getToken();
    final data = await apiService.getDetailCourse(event.id);

    if (data["status"] == 0) {
      emit(GetDetailCourseError(data["message"]));
    } else {
      final course = Course.fromJson(data["courseInfo"]);
      final checkRegisterData =
          await apiService.checkRegisterCourse(token.toString(), event.id);
      emit(GetDetailCourseSuccess(course, checkRegisterData["check"]));
    }
  }

  Future<void> onRegisterCourse(
      RegisterCourseEvent event, Emitter<DetailCourseState> emit) async {
    emit(RegisterCourseLoading());
    var token = await getToken();
    final data = await apiService.registerCourse(token.toString(), event.id);
    if (data["status"] == 0) {
      emit(RegisterCourseError(data["message"]));
    } else {
      emit(RegisterCourseSuccess());
    }
  }
}
