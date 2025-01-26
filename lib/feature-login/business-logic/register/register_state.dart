part of 'register_cubit.dart';

enum RegisterStatus{
  initial,
  success,
  loading,
  failure
}
 class RegisterState extends Equatable {
  final RegisterStatus registerStatus;

 const RegisterState({required this.registerStatus});
factory RegisterState.initial()=> const RegisterState(registerStatus: RegisterStatus.initial);

  @override
  // TODO: implement props
  List<Object?> get props => [registerStatus];
RegisterState copyWith({RegisterStatus ?registerStatus})=>RegisterState(registerStatus: registerStatus??this.registerStatus);
}


