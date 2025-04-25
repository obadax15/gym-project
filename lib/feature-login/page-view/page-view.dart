import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gymproject/feature-home-screen/presentation/pages/home-screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/Strings/color.dart';
import '../presentation/pages/login-screen.dart';

class CheckFirstTimePageView extends StatefulWidget {
  @override
  _CheckFirstTimePageViewState createState() => _CheckFirstTimePageViewState();
}

class _CheckFirstTimePageViewState extends State<CheckFirstTimePageView> {
  bool _isFirstTime = true;

  @override
  void initState() {
    super.initState();
    _checkFirstTime();
  }

  Future<void> _checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool seen = prefs.getBool('seenPageView') ?? false;

    if (seen) {
      // Navigate to main screen directly
      _goToMainScreen();
    } else {
      // Set the flag for the first-time user
      setState(() {
        _isFirstTime = true;
      });
    }
  }

  void _goToMainScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _isFirstTime ? FirstTimePageView(onComplete: _goToMainScreen) : SizedBox();
  }
}

class FirstTimePageView extends StatefulWidget {
  final VoidCallback onComplete;

  const FirstTimePageView({Key? key, required this.onComplete}) : super(key: key);

  @override
  _FirstTimePageViewState createState() => _FirstTimePageViewState();
}

class _FirstTimePageViewState extends State<FirstTimePageView> {
  final PageController _pageController = PageController();

  final List<String> photoAssets = [
    'assets/images/img_7.png',
    'assets/images/img_8.png',
    'assets/images/img_9.png',
  ];

  Timer? _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < photoAssets.length - 1) {
        setState(() {
          _currentPage++;
        });
      } else {
        setState(() {
          _currentPage = 0;
        });
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _onDone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('has_seen_page_view', true);

    if (mounted) {
      print('Navigating to LoginScreen');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LogInScreen(isupdate: true)),
      );
    } else {
      print('Context is unmounted or null');
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: photoAssets.length,
            itemBuilder: (context, index) {
              return Image.asset(
                photoAssets[index],
                fit: BoxFit.cover,
              );
            },
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: height / 2.4,
            child: Container(
              padding: EdgeInsets.all(12),
              height: height / 4,
              width: MediaQuery.of(context).size.width,
              color: purbleColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    _currentPage == photoAssets.length - 3
                        ? 'assets/images/img_10.png'
                        : _currentPage == photoAssets.length - 2
                            ? 'assets/images/img_11.png'
                            : 'assets/images/img_13.png',
                    height: 30,
                    width: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(38.0),
                    child: Center(
                      child: Text(
                        _currentPage == photoAssets.length - 3
                            ? 'Start your journey towards \n   more active lifestyle'
                            : _currentPage == photoAssets.length - 2
                                ? 'Find nutrition tips that fit\n        your lifestyle'
                                : 'A community for you,\n   challenge yourself',
                        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 32,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmoothPageIndicator(
                  controller: _pageController,
                  count: photoAssets.length,
                  effect: WormEffect(
                    activeDotColor: Colors.blue,
                    dotColor: Colors.grey,
                    dotHeight: 12,
                    dotWidth: 12,
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    print('Get Started Button Pressed'); // Debug message
                    _onDone();
                  },
                  child: Text("Get Started"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
