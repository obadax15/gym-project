// import 'dart:convert';
//
// import 'package:gymproject/core/Strings/base-url.dart';
// import 'package:http/http.dart'as http;
// import 'package:shared_preferences/shared_preferences.dart';
// class FrogetPasswordApi{
//
//
//   static Future forgetPassword(String email)async{
//     try{
//       final prefs=await SharedPreferences.getInstance();
//       final csrfToken=prefs.getString('csrfToken');
//       final sessionId=prefs.getString('sessionid');
//       if(csrfToken==null||sessionId==null){
//         print("❌ CSRF Token or Session ID not found. Please login first.");
//
//       }
//       print("✅ CSRF Token: $csrfToken");
//       print("✅ Session ID: $sessionId");
//       final response=await http.post(Uri.parse('${baseUrl}auth/user/update/'),
//           headers: {
//             "Accept": "application/json",
//             "Content-Type": "application/json",
//             'X-CSRFToken': csrfToken!,
//             'Cookie': 'sessionid=$sessionId; csrftoken=$csrfToken',
//           },
//       final response=await http.post(Uri.parse('${baseUrl}/auth/password/reset/'),
//       headers: {
//
//       }
//       ,body: );
//
//
//
//     }catch(e){
//       rethrow;
//     }
//   }
// }