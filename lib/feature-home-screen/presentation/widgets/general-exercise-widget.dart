import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gymproject/core/Strings/color.dart';

class GeneralExerciseWidget extends StatelessWidget {
  const GeneralExerciseWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(12),
          color: blackop,
        ),
        width: width / 2.22,
        height: height / 2.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Aligns items to the start
          children: [
            Container(child: Image.asset('assets/images/img_9.png',fit: BoxFit.fill,),width: width/2.23,height: height/4.5,),
            const SizedBox(height: 8), // Add spacing
          Column(children: [
          Align(
            alignment:Alignment.centerLeft,
            child: Text(
              'Squat exercise',
              style: TextStyle(
                color: textPurbleColor,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 8), // Add spacing
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Icon(Icons.timer_outlined, color: newpurble, size: 16),
                    const SizedBox(width: 2), // Add spacing
                    Text('12 Minutes', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Icon(Icons.fireplace_outlined, color: newpurble, size: 16),
                    const SizedBox(width: 2), // Add spacing
                    Text('120 Kcal', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
                    ],)
          ],
        ),
      ),
    );
  }
}
