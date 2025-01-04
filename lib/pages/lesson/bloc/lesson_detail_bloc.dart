import 'package:app/data/remote/apiService.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../model/lesson.dart';

part 'lesson_detail_event.dart';
part 'lesson_detail_state.dart';

class LessonDetailBloc extends Bloc<LessonDetailEvent, LessonDetailState> {
  LessonDetailBloc() : super(LessonDetailInitial()) {
    on<GetLessonDetailEvent>(onGetLessonDetail);
  }

  final apiService = ApiService();

  Future<void> onGetLessonDetail (GetLessonDetailEvent event, Emitter<LessonDetailState> emit) async{
    emit(LessonDetailLoading());
    final data = await apiService.getLessonInfo(event.lessonId);
    if(data["status"] == 0){
      emit(LessonDetailError(data["message"]));
    }else{
      final lesson = Lesson.fromJson(data["lessonInfo"]);
      emit(GetLessonDetailSuccess(lesson));
    }
  }

}
