import 'package:gymproject/core/Strings/base-url.dart';
import 'package:http/http.dart' as http;
class LogOUtApi{
  static Future logout()async{
    try{
      final response =await http.get(Uri.parse('${baseUrl}auth/logout/'),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
        },);
if(response.statusCode==200){
  return response.body;
}

    }catch(e){rethrow;}
  }
}