import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gymproject/core/Strings/token.dart';
import 'package:gymproject/feature-login/data/repo/register-repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterState.initial());
Future register(String userName, String email, String password, String passwordConfirmation, String phoneNumber)async{
try{
  emit(state.copyWith(registerStatus: RegisterStatus.loading));
  var rr=await RegisterRepo.register(userName, email, password, passwordConfirmation, phoneNumber);
  Token.token=rr['key'];
  print(Token.token.toString());
emit(state.copyWith(registerStatus: RegisterStatus.success));
}catch(e){
  emit(state.copyWith(registerStatus: RegisterStatus.failure));
}

}
}
