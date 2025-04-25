part of 'addupdate_addition_usd__cubit.dart';

enum AddUpdUserDetailsStatus{
  initial,
  success,
  loading,
  failure
}
class AddUpdateUserDetailsState extends Equatable {
  final AddUpdUserDetailsStatus addUpdUserDetailsStatus;

  const AddUpdateUserDetailsState({required this.addUpdUserDetailsStatus});
  factory AddUpdateUserDetailsState.initial()=> const AddUpdateUserDetailsState(addUpdUserDetailsStatus: AddUpdUserDetailsStatus.initial);

  @override
  // TODO: implement props
  List<Object?> get props => [addUpdUserDetailsStatus];
  AddUpdateUserDetailsState copyWith({AddUpdUserDetailsStatus ?addUpdUserDetailsStatus})=>AddUpdateUserDetailsState(addUpdUserDetailsStatus: addUpdUserDetailsStatus??this.addUpdUserDetailsStatus);
}
