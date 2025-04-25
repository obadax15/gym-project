import'package:flutter/material.dart';

import '../../../core/Strings/color.dart';
class TextFieldForming extends StatelessWidget {
  const TextFieldForming({Key? key, required this.textEditingController, required this.textInputType, required this.height, required this.width, required this.title, required this.isediting, required this.font_size, required this.distance, required this.alignmentGeometry}) : super(key: key);
final TextEditingController textEditingController;
final TextInputType textInputType;
final double height;
final double width;
final String title;
final bool isediting;
final double font_size;
final double distance;
final AlignmentGeometry alignmentGeometry;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Align(
          alignment: alignmentGeometry,
          child: Text(
            title,
            style:  TextStyle(color: textPurbleColor, fontWeight: FontWeight.bold, fontSize:font_size ),
          ),
        ),
        SizedBox(height: distance,),
        Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
            color: purbleColor,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Center(
            child: TextField(
              enabled: isediting,
              controller: textEditingController,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),
              keyboardType: textInputType,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}




