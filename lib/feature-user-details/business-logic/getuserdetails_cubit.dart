import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:gymproject/feature-user-details/data/repo/user-details-repo.dart';

part 'getuserdetails_state.dart';

class GetuserdetailsCubit extends Cubit<GetUserDetailsState> {
  GetuserdetailsCubit() : super(GetUserDetailsState.initial());
  Future getUserDetails()async{
emit(state.copyWith(getUserDetailStatus: GetUserDetailStatus.loading));

try{
  final getdetails;

  getdetails=await UserDetailsRepo.getUserDetails();
  emit(state.copyWith(getUserDetailStatus: GetUserDetailStatus.success));
  print(getdetails);
}catch(e){
  emit(state.copyWith(getUserDetailStatus: GetUserDetailStatus.failure));
}
  }
}
