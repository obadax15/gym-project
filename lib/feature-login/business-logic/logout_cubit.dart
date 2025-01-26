import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gymproject/feature-login/data/repo/logout-repo.dart';

part 'logout_state.dart';


class LogOutCubit extends Cubit<LogOutState> {
  LogOutCubit() : super(LogOutState.initial());
  Future logout()async{
    emit(state.copyWith(logOUtStatus: LogOUtStatus.loading));

    try{
      var rr=await LogOutRepo.logout();
      emit(state.copyWith(logOUtStatus: LogOUtStatus.success));
    }catch(e){
      emit(state.copyWith(logOUtStatus: LogOUtStatus.failure));
    }

  }


}
