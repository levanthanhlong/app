import 'package:app/data/remote/apiService.dart';
import 'package:app/model/course.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
   on<GetCategoryCoursesEvent>(onGetCategoryCourses);
  }

  final apiService = ApiService();

  Future<void> onGetCategoryCourses (GetCategoryCoursesEvent event, Emitter<CategoryState> emit) async {
    emit(CategoryLoading());
    final data = await apiService.getCoursesByCategory(event.category);
    if(data["status"] == 0){
      emit(CategoryError(data["message"]));
    }else{
      final List<Course> categoryCourses = (data['categoryCourses'] as List<dynamic>)
          .map((json) => Course.fromJson(json as Map<String, dynamic>))
          .toList();
      emit(GetCategoryCoursesSuccess(categoryCourses));
    }
  }
}
