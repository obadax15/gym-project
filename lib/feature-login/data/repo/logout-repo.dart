import '../api/logout-api.dart';

class LogOutRepo{
  static Future logout()async{
    try{
      final response=await LogOUtApi.logout();

    }catch(e){rethrow;}
  }
}