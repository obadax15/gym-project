import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gymproject/feature-user-details/data/repo/addupdate-addition-usd-repo.dart';
part 'addupdate_addition_usd__state.dart';


class AddUpdateUserDetailsCubit extends Cubit<AddUpdateUserDetailsState> {
  AddUpdateUserDetailsCubit() : super(AddUpdateUserDetailsState.initial());
  var rr;
   Future addUpdUserDet(double height,double weight,int age,String gender,String specificInjury)async{

    try{

      emit(state.copyWith(addUpdUserDetailsStatus: AddUpdUserDetailsStatus.loading));

      rr=await AddUpdUserDetRepo.addUpdUserDet(height, weight, age, gender, specificInjury
      );

      emit(state.copyWith(addUpdUserDetailsStatus: AddUpdUserDetailsStatus.success));
    }catch(e){
      emit(state.copyWith(addUpdUserDetailsStatus: AddUpdUserDetailsStatus.failure));
    }

  }


}
