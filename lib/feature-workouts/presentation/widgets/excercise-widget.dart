import 'package:flutter/material.dart';

import '../../../core/Strings/color.dart';

class ExcerciseWidget extends StatelessWidget {
  const ExcerciseWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          color: purbleColor,
          height: height / 1.5,
          width: width,
          child: Image.asset(
            'assets/images/img_9.png',
            height: height / 2,
            width: width / 1.1,

          ),
        ),
        SizedBox(height: 20,),
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),          color: textPurbleColor,
          ),
          height: height /7,
          width: width / 1.2,
          child: Column(
            children: [
              Text(
                "Kettleball Swing",
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),
              ),
              Center(
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed cursus libero eget.",
                ),
              ),
              Container(
                height: height / 20,
                width: width / 1.5,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),          color: Colors.white,
                ),                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text('30 secondes  '),
                      Text('3 reps  '),
                      Text('30 intremediate'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
