import 'dart:convert';

import 'package:gymproject/core/Strings/base-url.dart';
import 'package:http/http.dart' as http;

class RegisterApi {
  static Future<String> fetchCSRFToken() async {
    try {
      // Step 1: Make an initial GET request
      final response = await http.get(Uri.parse('${baseUrl}auth/registration/'));

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

  static Future register(
      String userName, String email, String password, String passwordConfirmation, String phoneNumber) async {
    try {
      final String csrf = await fetchCSRFToken();
      var response = await http.post(
        Uri.parse('${baseUrl}auth/registration/'),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
          'X-CSRFToken': csrf,
          'Cookie': 'csrftoken=$csrf',
        },
        body: jsonEncode({
          'username': userName,
          'email': email,
          'password1': password,
          'password2': passwordConfirmation,
          'phone_number': phoneNumber,
        }),
      );
      print(response.body);
      if (response.statusCode == 201) {
        return response.body;
      }
    } catch (e) {
      rethrow;
    }
  }
}
