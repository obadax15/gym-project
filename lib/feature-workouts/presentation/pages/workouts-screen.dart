import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:gymproject/core/Strings/color.dart';
import 'package:gymproject/core/Strings/token.dart';
import 'package:gymproject/feature-home-screen/presentation/widgets/appbarwidgets.dart';
import 'package:gymproject/feature-workouts/presentation/widgets/routines.dart';

import '../../../feature-home-screen/presentation/widgets/weekly-workouts-widget.dart';

class WorkOutsScreen extends StatefulWidget {
  const WorkOutsScreen({Key? key}) : super(key: key);

  @override
  State<WorkOutsScreen> createState() => _WorkOutsScreenState();
}

class _WorkOutsScreenState extends State<WorkOutsScreen> {
  int selectedindedx = 0;

  @override
  void initState() {
    print(Token.token + '=========================');
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackop,
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new_outlined,
                      size: 22,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: AppBarWidget(
                      title: 'Workouts',
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: buildWorkOutsCategories(),
              flex: 2,
            ),
            Container(
              width: double.infinity,
              height: 200,
              decoration: const BoxDecoration(color: purbleColor),
              child: const Center(
                child: WeeklyWorkOutWidget(),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Align(alignment: Alignment.centerLeft,
                  child: Text(
                selectedindedx == 0
                    ? 'Let\'s Go Beginner'
                    : selectedindedx == 1
                        ? 'Keep Rising Your Level'
                        : 'Unlock Your Potential',
                style: TextStyle(color: purbleColor, fontSize: 20, fontWeight: FontWeight.w700),
              )),
            ),SizedBox(height: 3,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Align(alignment: Alignment.centerLeft,
                  child: Text(
                selectedindedx == 0
                    ? 'Explore Different Workout Styles'
                    : selectedindedx == 1
                        ? 'Explore Intermediate Workouts'
                        : 'Explore Advanced Fitness Routinesl',
                style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w400),
              )),
            ),
            Expanded(
              flex: 7,
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (_, index) => Padding(
                  padding: const EdgeInsets.all(19.0),
                  child: RoutinesWidget(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildWorkOutsCategories() {
    List cat = ['Beginner', 'Intermediate', 'Advanced'];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Number of items in a row
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 2.5,
        ),
        itemCount: cat.length,
        itemBuilder: (_, index) {
          bool isselected = selectedindedx == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedindedx = index;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: isselected ? Colors.white : textPurbleColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  cat[index],
                  style: TextStyle(color: isselected ? newpurble : Colors.black, fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
