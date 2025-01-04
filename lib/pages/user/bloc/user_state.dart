part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserInitial extends UserState {}

class UserError extends UserState {
  final String error;

  UserError(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}

class UserLoading extends UserState{}

class GetUserInfoSuccess extends UserState{
  final String fullName;

  GetUserInfoSuccess(this.fullName);

  @override
  // TODO: implement props
  List<Object?> get props => [fullName];
}
