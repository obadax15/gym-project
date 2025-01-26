import 'dart:convert';

import 'package:gymproject/feature-login/data/api/register-api.dart';

class RegisterRepo{
static Future register( String userName, String email, String password, String passwordConfirmation, String phoneNumber)async{
  try{
var response =await RegisterApi.register(userName, email, password, passwordConfirmation, phoneNumber);
return jsonDecode(response);
  }catch(e){rethrow;}
}

}