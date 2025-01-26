import 'dart:convert';

import 'package:gymproject/core/Strings/base-url.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginApi {static Future<String> fetchSessionId() async {
  try {
    // Step 1: Make an initial GET request (adjust URL to your login endpoint)
    final response = await http.get(Uri.parse('${baseUrl}auth/login/'));

    // Step 2: Check the response headers for cookies
    final cookies = response.headers['set-cookie'];
    if (cookies != null) {
      // Step 3: Extract the sessionid from the cookies
      final sessionId = RegExp(r'sessionid=([^;]+)').firstMatch(cookies)?.group(1);
      if (sessionId != null) {
        print("Session ID fetched: $sessionId");
        return sessionId;
      }
    }
    print("Session ID not found in cookies.");
  } catch (e) {
    print("Error fetching session ID: $e");
  }
  return '';
}
static Future<void> _storeSessionId(String sessionId) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('sessionid', sessionId);
}

static Future<String> fetchCSRFToken() async {
    try {
      // Step 1: Make an initial GET request
      final response = await http.get(Uri.parse('${baseUrl}auth/login/'));

      // Step 2: Check the response headers for cookies
      final cookies = response.headers['set-cookie'];
      if (cookies != null) {
        // Step 3: Extract the CSRF token from the cookies
        final csrfToken = RegExp(r'csrftoken=([^;]+)').firstMatch(cookies)?.group(1);
        if (csrfToken != null) {
          print("CSRF Token fetched: $csrfToken");
          return csrfToken;
        }
      }
      print("CSRF token not found in cookies.");
    } catch (e) {
      print("Error fetching CSRF token: $e");
    }
    return '';
  }

  static Future logIn(
      String userName, String email, String password, ) async {
    try {
      final String csrf = await fetchCSRFToken();
      print(csrf);
      var response = await http.post(
        Uri.parse('${baseUrl}auth/login/'),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
          'X-CSRFToken': csrf,
        },

        body: jsonEncode({
          'username': userName,
          'email': email,
          'password': password,

        }),
      );
      print(response.body);
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      rethrow;
    }
  }
static Future<String?> getStoredSessionId() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('sessionid');
}
}
