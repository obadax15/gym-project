import 'package:flutter/material.dart';
import 'package:gymproject/feature-Nutritional-plan/presentation/screens/food-categories-screen.dart';

import '../../../core/Strings/color.dart';
import '../../../feature-workouts/presentation/pages/workouts-screen.dart';

class MakeIconsListView extends StatelessWidget {
  const MakeIconsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 60,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final icontext = ['Workouts', 'Progress', 'Nutrition', 'Community'];

            return Row(
              children: [
                GestureDetector(
                    onTap: () {
                      if (index == 0) {
                        Navigator.of(context).push(_createSlideRoute(WorkOutsScreen()));
                      } else if(index==2){
                        Navigator.of(context).push(_createSlideRoute(FoodCategoriesScreen()));

                      }
                    },
                    child: Column(
                      children: [
                        Icon(
                          index == 0
                              ? Icons.sports_bar_outlined
                              : index == 1
                                  ? Icons.schedule_outlined
                                  : index == 2
                                      ? Icons.apple_outlined
                                      : Icons.groups_outlined,
                          size: 40,
                          color: textPurbleColor,
                        ),
                        Text(
                          icontext[index],
                          style: const TextStyle(fontSize: 12, color: textPurbleColor),
                        ),
                      ],
                    )),
                if (index < 3)
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: SizedBox(
                      height: 30,
                      child: VerticalDivider(
                        thickness: 2, // Thickness of the line
                        color: Colors.white, // Color of the line
                      ),
                    ),
                  ),
              ],
            );
          },
          itemCount: 4,
        ),
      ),
    );
  }
}

Route _createSlideRoute(Widget widget) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => widget,
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
