import 'package:flutter/material.dart';
import 'package:gymproject/core/Strings/color.dart';

class WeeklyWorkOutWidget extends StatelessWidget {
  const WeeklyWorkOutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      height: height / 5,
      color: purbleColor,
      child: Center(
        child: Container(
          width: width / 1.3,
          height: height / 7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color:Colors.black87,
          ),
          child: Row(
            children: [
              const Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        '  Weekly \nChallenge ',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: textPurbleColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(child: Text('plank with Hip Twist',style: TextStyle(color: Colors.white,fontSize: 12),)),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:  BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius:  BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/img_3.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
