import 'package:app/data/remote/apiService.dart';
import 'package:app/utls/use_token.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<GetUserInfoEvent> (onGetUserInfo);
  }
  final apiService = ApiService();

  Future<void> onGetUserInfo (GetUserInfoEvent event, Emitter<UserState> emit) async {
    emit(UserLoading());
    final token = await getToken();
    print(token);
    final data = await apiService.getUserInfo(token!);
    if(data["status"] == 0) {
      emit(UserError(data["message"]));
    }else {
      emit(GetUserInfoSuccess(data["fullname"]));
    }
  }
}
