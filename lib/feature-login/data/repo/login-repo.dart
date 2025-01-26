import 'dart:convert';

import 'package:gymproject/feature-login/data/api/login-api.dart';
import 'package:gymproject/feature-login/data/api/register-api.dart';

class LoginRepo{
  static Future logIn( String userName, String email, String password, )async{
    try{
      var response =await LoginApi.logIn(userName, email, password, );
      return jsonDecode(response!);
    }catch(e){rethrow;}
  }

}