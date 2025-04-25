// ignore_for_file: avoid_print

import 'package:gymproject/core/Strings/base-url.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class UserDetailsApi {

  static Future<String> getUserDetails() async {
    try {
      // Get the stored session ID and CSRF token
      final prefs = await SharedPreferences.getInstance();
      final csrfToken = prefs.getString('csrfToken');
      final sessionId = prefs.getString('sessionid');

      if (csrfToken == null || sessionId == null) {
        print("❌ CSRF Token or Session ID not found. Please login first.");
        return ''; // Return an empty string if no token is found
      }

      print("✅ CSRF Token: $csrfToken");
      print("✅ Session ID: $sessionId");

      // Fetch user details using stored CSRF token and session ID
      final response = await http.get(
        Uri.parse('${baseUrl}auth/user/details/'),
        headers: {
          'Accept': 'application/json',
          'X-CSRFToken': csrfToken,
          'Cookie': 'sessionid=$sessionId',
        },
      );

      if (response.statusCode == 200) {
        print("✅ User Details: ${response.body}");
        return response.body; // Return the user details as a string
      } else {
        print("❌ Error fetching user details: ${response.statusCode}");
      }
    } catch (e) {
      print("⚠️ Error fetching user details: $e");
    }
    return ''; // Return empty string if any error occurs
  }

  static Future getAdditionUserDetails()async{
    try{
      final prefs=await SharedPreferences.getInstance();
      final csrfToken=prefs.getString('csrfToken');
      final sessionId=prefs.getString('sessionid');
      if(csrfToken==null||sessionId==null){
        print("❌ CSRF Token or Session ID not found. Please login first.");

      }
      print("✅ CSRF Token: $csrfToken");
      print("✅ Session ID: $sessionId");

final response=await http.get(Uri.parse('http://192.168.1.109:8000/api/auth/user/update/'),
headers: {
  'Accept': 'application/json',
  'X-CSRFToken': csrfToken!,
  'Cookie': 'sessionid=$sessionId',

});
if(response.statusCode==200){
  print("✅ Addition User Details: ${response.body}");

  return response.body;

}else{
  print('error to fetch addition user Details${response.statusCode}');
}

    }catch(e){
      print("⚠️ Error fetching user details: $e");

    }

  }
}
