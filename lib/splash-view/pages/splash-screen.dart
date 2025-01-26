import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../feature-home-screen/presentation/pages/home-screen.dart';
import '../../feature-login/page-view/page-view.dart';
import '../../feature-login/presentation/pages/login-screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    await Future.delayed(Duration(seconds: 2)); // Splash delay

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.containsKey('token');
    bool hasSeenPageView = prefs.getBool('has_seen_page_view') ?? false;

    if (isLoggedIn) {
      // If user is already logged in, go to the HomeScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else if (hasSeenPageView) {
      // If PageView has already been seen, go to LoginScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LogInScreen()),
      );
    } else {
      // If it's the user's first time, show PageView
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => FirstTimePageView(onComplete: _navigateToLogin)),
      );
    }
  }

  void _navigateToLogin() {
    if (mounted) {  // Check if the context is still available
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LogInScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Stack(
        children: [
          // Background Image
          Image.asset('assets/images/img_5.png', fit: BoxFit.cover),

          // Circular Progress Indicator
          Positioned(
            left: 0,
            right: 0,
            bottom: 50,  // Adjust this as needed
            child: const Center(
              child: CircularProgressIndicator(
                color: Colors.deepPurple,
              ),
            ),
          ),
        ],
    );
  }

}
