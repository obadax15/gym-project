import 'package:flutter/material.dart';

import '../../../core/Strings/color.dart';
class BuildUserInfoSection extends StatelessWidget {
  const BuildUserInfoSection({super.key, required this.title, required this.value});
final String title;
final String value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: textPurbleColor, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          _buildContainer(value),
        ],
      ),
    );  }
}

Container _buildContainer(String value) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: 10),
    decoration: const BoxDecoration(
      color: purbleColor,
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    child: Center(
      child: Text(
        value,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
      ),
    ),
  );
}