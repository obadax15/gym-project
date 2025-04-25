import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:gymproject/feature-home-screen/presentation/pages/home-screen.dart';
import 'package:gymproject/feature-workouts/presentation/pages/workouts-screen.dart';
import '../../../core/Strings/color.dart';


class MakeBottomBar extends StatefulWidget {
  const MakeBottomBar({super.key});

  @override
  _MakeBottomBarState createState() => _MakeBottomBarState();
}

class _MakeBottomBarState extends State<MakeBottomBar> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomeScreen(),
          WorkOutsScreen(),
          HomeScreen(),
        ],
      ),
      bottomNavigationBar: ConvexAppBar(
        color: Colors.white,
        backgroundColor: textPurbleColor,
        style: TabStyle.react,
        items: const [
          TabItem(icon: Icons.home_outlined, title: 'Home'),
          TabItem(icon: Icons.favorite_border_outlined, title: 'Fav'),
          TabItem(icon: Icons.support_agent_outlined, title: 'Support'),
        ],
        initialActiveIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
