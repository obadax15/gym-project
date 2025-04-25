import '../api/logout-api.dart';

class LogOutRepo{
  static Future logout()async{
    try{
     await LogOUtApi.logout();

    }catch(e){rethrow;}
  }
}