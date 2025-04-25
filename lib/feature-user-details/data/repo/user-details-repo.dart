import 'dart:convert';

import 'package:gymproject/feature-user-details/data/api/user-details-api.dart';

class UserDetailsRepo{
  static Future getUserDetails()async{
    try{
      var response=await UserDetailsApi.getUserDetails();

      return jsonDecode(response);
    }catch(e){rethrow;}
  }

  static Future getAdditionUserDetails()async{
    try{
      var response=await UserDetailsApi.getAdditionUserDetails();

      return jsonDecode(response);
    }catch(e){rethrow;}
  }
}