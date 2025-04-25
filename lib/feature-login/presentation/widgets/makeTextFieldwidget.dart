import 'package:flutter/material.dart';

class MakeTextFormField extends StatelessWidget {
  MakeTextFormField({
    Key? key,
    required this.textEditingController,
    required this.hinttext,
    required this.icon,
    required this.textInputType,
    this.validator,
    // Add validator parameter
  }) : super(key: key);

  final TextEditingController? textEditingController;
  final String hinttext;
  final Icon icon;
  final TextInputType textInputType;
  final String? Function(String?)? validator; // Validator function

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width / 1.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align error messages to the left
        children: [
          TextFormField(
            controller: textEditingController,
            keyboardType: textInputType,
            decoration: InputDecoration(
              hintText: hinttext,
              suffixIcon: icon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.white),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
            validator: validator, // Use validator
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}
