import 'dart:convert';

import 'package:gymproject/feature-user-details/data/api/addupdate-addition-usd-api.dart';

class AddUpdUserDetRepo{
  static Future addUpdUserDet(double height,double weight,int age,String gender,String specificInjury)async {
try{
  final response=await AddUpdateUserDetApi.addUpdUserDet(height, weight, age, gender, specificInjury);
return jsonDecode(response);

}catch(e){rethrow;}

  }}