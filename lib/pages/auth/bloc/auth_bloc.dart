import 'package:app/data/remote/apiService.dart';
import 'package:app/utls/use_token.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';

part 'auth_state.dart';



class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>(onLogin);
    on<RegisterEvent>(onRegister);
  }
  final apiService = ApiService();
  Future<void> onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final data = await apiService.login(event.username, event.password);
    print(data);
    if(data["status"] == 0){
      emit(AuthFailure(data["message"]));
    }else{
      saveToken(data["token"]);
      emit(AuthSuccess());
    }
  }

  Future<void> onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final data = await apiService.register(username: event.username, password: event.password, email: event.email, fullName: event.fullName);
    print(data);
    if(data["status"] == 0) {
      emit(AuthFailure(data["message"]));
    }else{
      saveToken(data["token"]);
      emit(AuthSuccess());
    }
  }
}
