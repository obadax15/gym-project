import 'package:flutter/material.dart';
import 'package:gymproject/core/Strings/color.dart';

class GeneralExerciseWidget extends StatelessWidget {
  const GeneralExerciseWidget({super.key});

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
        width: width / 2.32,
        height: height / 2.3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Aligns items to the start
          children: [
            SizedBox(
              width: width / 2.23,
              height: height / 4,
              child: Image.asset(
                'assets/images/img_7.png',
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 7), // Add spacing
            Column(
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Squat exercise',
                    style: TextStyle(
                      color: newpurble,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: height/30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [makeExerciseDetails()],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget makeExerciseDetails() {
    return Row(
      children: [
        Container(
          child: (const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.fireplace_outlined, size: 12, color: purbleColor),
              SizedBox(width: 5),
              Text("120 ka", style: TextStyle(fontSize: 12, color: Colors.white)),
            ],
          )),
        ),
        const SizedBox(
          height: 20,
          width: 50,
          child: VerticalDivider(thickness: 2, color: textPurbleColor),
        ),
        Container(
          child: (const Row(
            children: [
              Icon(Icons.fireplace_outlined, size: 12, color: purbleColor),
              SizedBox(width: 5),
              Text("120 ka", style: TextStyle(fontSize: 12, color: Colors.white)),
            ],
          )),
        ),
      ],
    );
  }
}
