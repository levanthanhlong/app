part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

//  "username": "lethanh3",
//     "password":  "123456"

class LoginEvent extends AuthEvent {
  final String username;
  final String password;

  LoginEvent({required this.username, required this.password});

  @override
  // TODO: implement props
  List<Object?> get props => [username, password];
}

//     "username": "lethanh3",
//     "password": "123456",
//     "email": "thanh@gmail.com",
//     "fullname": "Lê Văn Thành"

class RegisterEvent extends AuthEvent {
  final String username;
  final String password;
  final String email;
  final String fullName;

  RegisterEvent(
      {required this.username,
      required this.password,
      required this.email,
      required this.fullName});

  @override
  // TODO: implement props
  List<Object?> get props => [username, password, email, fullName];
}
