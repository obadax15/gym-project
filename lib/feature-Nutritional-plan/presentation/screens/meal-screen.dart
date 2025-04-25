import 'package:flutter/material.dart';

import '../../data/food-model.dart';

class MealScreen extends StatelessWidget {
  final List<FoodItem> selectedItems;

  const MealScreen({super.key, required this.selectedItems});

  int get totalCalories => selectedItems.fold(0, (sum, item) => sum + item.calories);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Custom Meal")),
      body: ListView.builder(
        itemCount: selectedItems.length,
        itemBuilder: (_, index) {
          final item = selectedItems[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: Image.asset(item.image, width: 50, height: 50, fit: BoxFit.cover),
              title: Text(item.name),
              subtitle: Text('${item.calories} cal'),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Total Calories: $totalCalories',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
