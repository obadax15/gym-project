import 'dart:convert';
import 'package:gymproject/core/Strings/base-url.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginApi {
  static Future<String?> logIn(String userName, String email, String password) async {
    try {
      var response = await http.post(
        Uri.parse('${baseUrl}auth/login/'),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          'username': userName,
          'email': email,
          'password': password,
        }),
      );

      print("🔹 Login Response: ${response.body}");

      if (response.statusCode == 200) {
        var cookies = response.headers['set-cookie'];
        print("🍪 Cookies after login: $cookies");

        if (cookies != null) {
          final csrfToken = RegExp(r'csrftoken=([^;]+)').firstMatch(cookies)?.group(1);
          final sessionId = RegExp(r'sessionid=([^;]+)').firstMatch(cookies)?.group(1);

          if (csrfToken != null && sessionId != null) {
            final prefs = await SharedPreferences.getInstance();
            await prefs.setString('csrfToken', csrfToken);
            await prefs.setString('sessionid', sessionId);

            print("✅ CSRF Token: $csrfToken");
            print("✅ Session ID: $sessionId");

            // You can return the response body as a string here if needed
            return response.body;
          }
        }
      } else {
        print("❌ Login failed: ${response.statusCode}");
      }
    } catch (e) {
      print("⚠️ Login Error: $e");
    }
    return null;
  }

  static Future<String?> getStoredSessionId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('sessionid');
  }
}
