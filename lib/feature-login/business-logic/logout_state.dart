part of 'logout_cubit.dart';
enum LogOUtStatus{
  initial,
  success,
  loading,
  failure
}
class LogOutState extends Equatable {
  final LogOUtStatus logOUtStatus;

  const LogOutState({required this.logOUtStatus});
  factory LogOutState.initial()=> const LogOutState(logOUtStatus: LogOUtStatus.initial);

  @override
  // TODO: implement props
  List<Object?> get props => [logOUtStatus];
  LogOutState copyWith({LogOUtStatus ?logOUtStatus})=>LogOutState(logOUtStatus: logOUtStatus??this.logOUtStatus);
}




