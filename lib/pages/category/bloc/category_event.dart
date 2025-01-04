part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetCategoryCoursesEvent extends CategoryEvent {
  final String category;

  GetCategoryCoursesEvent(this.category);

  @override
  // TODO: implement props
  List<Object?> get props => [category];
}
