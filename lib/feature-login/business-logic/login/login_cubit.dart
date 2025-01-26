import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gymproject/feature-login/data/api/login-api.dart';
import 'package:gymproject/feature-login/data/repo/login-repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/Strings/token.dart';

part 'login_state.dart';

class LogInCubit extends Cubit<LoginState> {
  LogInCubit() : super(LoginState.initial());
  Future logIn(String userName, String email, String password, )async{
    try{
      emit(state.copyWith(loginStatus: LoginStatus.loading));
      var rr=await LoginRepo.logIn(userName, email, password, );
      String token=rr['key'];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
      Token.token=token;
      await LoginApi.fetchSessionId();
await LoginApi.getStoredSessionId();

      print(Token.token.toString());
      emit(state.copyWith(loginStatus: LoginStatus.success));
    }catch(e){
      emit(state.copyWith(loginStatus: LoginStatus.failure));
    }

  }


}
