import 'dart:convert';

import 'package:gymproject/core/Strings/base-url.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';
class AddUpdateUserDetApi{
  static Future addUpdUserDet(double height,double weight,int age,String gender,String specificInjury)async{
try{
  final prefs=await SharedPreferences.getInstance();
  final csrfToken=prefs.getString('csrfToken');
  final sessionId=prefs.getString('sessionid');
  if(csrfToken==null||sessionId==null){
    print("❌ CSRF Token or Session ID not found. Please login first.");

  }
  print("✅ CSRF Token: $csrfToken");
  print("✅ Session ID: $sessionId");
  final response=await http.post(Uri.parse('${baseUrl}auth/user/update/'),
  headers: {
    "Accept": "application/json",
    "Content-Type": "application/json",
    'X-CSRFToken': csrfToken!,
    'Cookie': 'sessionid=$sessionId; csrftoken=$csrfToken',
  },

  body: jsonEncode({
    'height':height,
'weight':weight,
    'age':age,
    'gender':gender,
    "specific_injury": specificInjury

  }),

  );
  if(response.statusCode==200){
    print(response.body);
    return response.body;
  }else{
    print(response.body);
    print(response.statusCode);
  }


}catch(e){rethrow;}
    
  }

}