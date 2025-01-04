part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryError extends CategoryState {
  final String error;

  CategoryError(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetCategoryCoursesSuccess extends CategoryState {
  final List<Course> categoryCourses;

  GetCategoryCoursesSuccess(this.categoryCourses);

  @override
  // TODO: implement props
  List<Object?> get props => [categoryCourses];
}
