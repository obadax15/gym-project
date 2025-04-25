import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gymproject/feature-workouts/presentation/pages/show-excercise.dart';
import 'package:gymproject/feature-workouts/presentation/widgets/card-excercise.dart';

import '../../../core/Strings/color.dart';
import '../../../feature-home-screen/presentation/widgets/appbarwidgets.dart';
import '../../../feature-home-screen/presentation/widgets/weekly-workouts-widget.dart';

class Show_Routine_Screen extends StatelessWidget {
  const Show_Routine_Screen({super.key, required this.index2});
  final int index2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackop,
      body: Column(children: [
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
                  title: index2 == 0 ? 'Beginner' : index2 == 1 ? 'Intermediate' : 'Advanced',
                ),
              ),
            ),
          ],
        ),
        Container(
          width: double.infinity,
          height: 200,
          decoration: const BoxDecoration(color: purbleColor),
          child: const Center(
            child: WeeklyWorkOutWidget(),
          ),
        ),
        Expanded(flex:2,child: ListView.builder(itemBuilder: (_, index) => Padding(
          padding: EdgeInsets.all(8.0),
          child: GestureDetector(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Show_excercise(index: index2)));},child: Card_Excercise(excercisename: 'KattelBell Swing', repititionnumber: 3, excercisetime: 30)),
        ), itemCount: 4,))
      ],
      ),
    );
  }
}
