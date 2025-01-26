import 'package:flutter/material.dart';
import 'package:gymproject/core/Strings/token.dart';

import '../../../core/Strings/color.dart';
import '../../../feature-user-details/presentation/pages/user-info.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Add padding
      height: 80, // Set a fixed height
      decoration: BoxDecoration(
        color: Colors.transparent, // Adjust the background color if needed
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Evenly space items
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Color.fromRGBO(200, 108, 254, 1),
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search_outlined,
                  size: 28, // Resize icon
                ),
                color: textPurbleColor,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                  size: 28, // Resize icon
                ),
                color: textPurbleColor,
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(_createSlideRoute());
                  print(Token.token+'=======================================');
                },
                icon: const Icon(
                  Icons.person,
                  size: 28, // Resize icon
                ),
                color: textPurbleColor,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Route _createSlideRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>  UserInfo(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(1.0, 0.0); // Slide from the right
        var end = Offset.zero; // End at the original position
        var curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}
