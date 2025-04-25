import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:gymproject/feature-Nutritional-plan/presentation/screens/food-categories-screen.dart';
import 'package:gymproject/feature-user-details/presentation/pages/user-info.dart';
import 'package:gymproject/feature-workouts/presentation/pages/workouts-screen.dart';
import '../../core/Strings/color.dart';
import '../feature-favourite/presentation/pages/fav-screen.dart';
import '../feature-home-screen/presentation/pages/home-screen.dart';


class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens =  [
    HomeScreen(),
    FavScreen(),
    FoodCategoriesScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackop,
      body: _screens[_selectedIndex],
      bottomNavigationBar: ConvexAppBar(
        color: Colors.white,
        backgroundColor: textPurbleColor,
        style: TabStyle.react,
        items: const [
          TabItem(icon: Icons.home_outlined, title: 'Home'),
          TabItem(icon: Icons.favorite_border_outlined, title: 'Fav'),
          TabItem(icon: Icons.fastfood_outlined, title: 'Your Diet'),
        ],
        initialActiveIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
