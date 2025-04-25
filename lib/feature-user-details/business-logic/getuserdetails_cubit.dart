import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:gymproject/feature-user-details/data/api/user-details-api.dart';
import 'package:gymproject/feature-user-details/data/repo/user-details-repo.dart';

part 'getuserdetails_state.dart';

class GetuserdetailsCubit extends Cubit<GetUserDetailsState> {
  GetuserdetailsCubit() : super(GetUserDetailsState.initial());
  var rr;
  var ad;

  Future getUserDetails()async{
emit(state.copyWith(getUserDetailStatus: GetUserDetailStatus.loading));
try{
 rr=await UserDetailsRepo.getUserDetails();
 ad=await UserDetailsRepo.getAdditionUserDetails();
  emit(state.copyWith(getUserDetailStatus: GetUserDetailStatus.success));
}catch(e){
  emit(state.copyWith(getUserDetailStatus: GetUserDetailStatus.failure));
}
  }
}
