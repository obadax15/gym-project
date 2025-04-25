import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gymproject/feature-login/data/repo/logout-repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'logout_state.dart';


class LogOutCubit extends Cubit<LogOutState> {
  LogOutCubit() : super(LogOutState.initial());

  Future logout()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    emit(state.copyWith(logOUtStatus: LogOUtStatus.loading));

    try{
      await LogOutRepo.logout();

      emit(state.copyWith(logOUtStatus: LogOUtStatus.success));
      prefs.clear();
    }catch(e){
      emit(state.copyWith(logOUtStatus: LogOUtStatus.failure));
    }

  }


}
