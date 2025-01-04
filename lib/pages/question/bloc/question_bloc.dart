import 'package:app/data/remote/apiService.dart';
import 'package:app/model/lesson_question.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'question_event.dart';
part 'question_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  QuestionBloc() : super(QuestionInitial()) {
    on<GetQuestionListEvent>(onGetQuestionList);
  }
  final apiService = ApiService();
  Future<void> onGetQuestionList(GetQuestionListEvent event, Emitter<QuestionState> emit) async {
    emit(QuestionLoading());
    final data = await apiService.getQuestionsInLesson(event.lessonId);
    if(data["status"] == 0){
      emit(QuestionError(data["message"]));
    }else{
      final List<LessonQuestion> listQuestion = (data['listQuestions'] as List<dynamic>)
          .map((json) => LessonQuestion.fromJson(json as Map<String, dynamic>))
          .toList();
      emit(GetQuestionSuccess(listQuestion));
    }
  }
}
