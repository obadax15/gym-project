import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://yourbackend.com/";

  /// Logs in the user and returns cookies.
  static Future<Map<String, String>> loginUser() async {
    try {
      var response = await http.post(
        Uri.parse('${baseUrl}auth/login/'),
        body: {
          'username': 'your_username',
          'password': 'your_password',
        },
      );

      print("🔹 Login Response: ${response.body}");
      print("🔹 Login Headers: ${response.headers}");

      if (response.statusCode == 200) {
        // Extract the Set-Cookie header
        var cookies = response.headers['set-cookie'];
        print("🍪 Cookies after login: $cookies");

        if (cookies != null) {
          return {'Cookie': cookies}; // Return cookies for future requests
        }
      }
    } catch (e) {
      print("⚠️ Login error: $e");
    }
    return {}; // Return empty map if login fails
  }

  /// Fetches the CSRF token after logging in.
  static Future<String> fetchCSRFToken() async {
    try {
      var cookies = await loginUser(); // Get login cookies first
      if (cookies.isEmpty) {
        print("❌ Login failed, cannot fetch CSRF token.");
        return '';
      }

      var response = await http.get(
        Uri.parse('${baseUrl}auth/user/details/'),
        headers: cookies, // Send authentication cookies
      );

      print("🔹 Response Headers: ${response.headers}");
      print("🔹 Response Body: ${response.body}");

      final setCookies = response.headers['set-cookie'];
      if (setCookies != null) {
        final csrfTokenMatch = RegExp(r'csrftoken=([^;]+)').firstMatch(setCookies);
        if (csrfTokenMatch != null) {
          final csrfToken = csrfTokenMatch.group(1);
          print("✅ CSRF Token fetched: $csrfToken");
          return csrfToken!;
        }
      }
      print("❌ CSRF token not found in cookies.");
    } catch (e) {
      print("⚠️ Error fetching CSRF token: $e");
    }
    return '';
  }
}
