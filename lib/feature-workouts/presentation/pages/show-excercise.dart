import 'package:flutter/material.dart';
import 'package:gymproject/feature-workouts/presentation/widgets/excercise-widget.dart';

import '../../../core/Strings/color.dart';
import '../../../feature-home-screen/presentation/widgets/appbarwidgets.dart';
class Show_excercise extends StatelessWidget {
  const Show_excercise({Key? key, required this.index}) : super(key: key);
final int index;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(backgroundColor: blackop,
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
                    title: index == 0 ? 'Beginner' : index == 1 ? 'Intermediate' : 'Advanced',
                  ),
                ),
              ),
            ],
          ),

       ExcerciseWidget(),
        ],
      ),
    ),
    );
  }
}
