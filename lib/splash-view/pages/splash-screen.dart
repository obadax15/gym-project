// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:gymproject/feature-navigation/navigation-screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../feature-login/page-view/page-view.dart';
import '../../feature-login/presentation/pages/login-screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkLoginStatus());
  }

  Future<void> _checkLoginStatus() async {
    await Future.delayed(const Duration(seconds: 2)); // Splash delay

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.containsKey('token');
    bool hasSeenPageView = prefs.getBool('has_seen_page_view') ?? false;

    if (!mounted) return; // Prevent memory leaks

    if (isLoggedIn) {
      // Navigate to MainScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const NavigationScreen()),
      );
    } else if (hasSeenPageView) {
      // Navigate to LoginScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LogInScreen(isupdate: true)),
      );
    } else {
      // First-time users see the PageView
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => FirstTimePageView(onComplete: _navigateToLogin)),
      );
    }
  }

  void _navigateToLogin() {
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LogInScreen(isupdate: false)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(fit: StackFit.expand,
          children: [
            Image.asset('assets/images/img_5.png', fit: BoxFit.fill,),
            const Positioned(
              left: 0,
              right: 0,
              bottom: 50,
              child: Center(
                child: CircularProgressIndicator(color: Colors.deepPurple),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
