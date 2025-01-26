import 'package:flutter/material.dart';
class MakeTextFormField extends StatelessWidget {
  MakeTextFormField(
      {Key? key, required this.textEditingController, required this.hinttext, required this.icon, required this.textInputType})
      : super(key: key);
  final TextEditingController? textEditingController;
  final String hinttext;

  final Icon icon;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(10),

      color: Colors.white),
      width: width / 1.5,
      child: Padding(
        padding: const EdgeInsets.only(left: 28.0),
        child: TextFormField(
          controller: textEditingController,
          keyboardType: textInputType,
          decoration: InputDecoration(
            hintText: hinttext,
            suffixIcon: icon,
          ),
        ),
      ),
    );
  }
}

