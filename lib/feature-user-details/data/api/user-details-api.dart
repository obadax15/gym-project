import 'dart:convert';
import 'package:gymproject/core/Strings/token.dart';
import 'package:gymproject/feature-login/data/api/login-api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../core/Strings/base-url.dart';

class UserDetailsApi {



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


  static  getUserDetails() async {
    try {
      Future<String?> sessionId= LoginApi.getStoredSessionId();
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final String csrf = await LoginApi.fetchCSRFToken();


      final response = await http.get(
        Uri.parse('http://192.168.1.110:8000/api/auth/user/details/'),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
          'X-CSRFToken':csrf,
          'Cookie': 'sessionid=$sessionId',
      },
      );

      if (response.statusCode == 200) {
        return response.body;
      } else {
        print("Error: ${response.statusCode} - ${response.body}");
        throw Exception("Failed to fetch user details. ${response.body}");
      }
    } catch (e) {
      print("Error in UserDetailsApi: $e");
      rethrow;
    }
  }
}
