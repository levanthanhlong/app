part of 'get_detail_course_bloc.dart';

abstract class DetailCourseEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetDetailCourseEvent extends DetailCourseEvent {
  final int id;

  GetDetailCourseEvent(this.id);

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}

class RegisterCourseEvent extends DetailCourseEvent {
  final int id;

  RegisterCourseEvent(this.id);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
