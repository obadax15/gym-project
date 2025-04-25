import 'package:flutter/material.dart';
import 'package:gymproject/feature-home-screen/presentation/widgets/appbarwidgets.dart';

import '../../../core/Strings/color.dart';
import '../../data/food-model.dart';
import 'meal-screen.dart';



class FoodCategoriesScreen extends StatefulWidget {
  const FoodCategoriesScreen({super.key});

  @override
  _FoodCategoriesScreenState createState() => _FoodCategoriesScreenState();
}

class _FoodCategoriesScreenState extends State<FoodCategoriesScreen> {
  final Set<FoodItem> selectedItems = {};

  void _toggleSelect(FoodItem item) {
    setState(() {
      selectedItems.contains(item) ? selectedItems.remove(item) : selectedItems.add(item);
    });
  }

  void _goToMealScreen() {
    if (selectedItems.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MealScreen(selectedItems: selectedItems.toList()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final categories = allFoodItems.map((e) => e.category).toSet();

    return Scaffold(
      backgroundColor: blackop,
        body :Column(
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
                      title: 'Your Diet',
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                  children: categories.map((category) {
                    final items = allFoodItems.where((item) => item.category == category).toList();
                    return Theme(
                      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        collapsedIconColor: newpurble,
                        iconColor: newpurble,
                        title: Text(
                          category,
                          style: const TextStyle(color: purbleColor, fontWeight: FontWeight.bold),
                        ),
                        children: items.map((item) {
                          final selected = selectedItems.contains(item);
                          return Card(
                            color: Colors.grey[900],
                            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                            child: ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(item.image, height: 50, width: 50, fit: BoxFit.cover),
                              ),
                              title: Text(item.name, style: const TextStyle(color: Colors.white)),
                              subtitle: Text('${item.calories} cal', style: const TextStyle(color: Colors.grey)),
                              trailing: Checkbox(
                                value: selected,
                                onChanged: (_) => _toggleSelect(item),
                                activeColor: newpurble,
                              ),
                              onTap: () => _toggleSelect(item),
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  }).toList(),



              ),
            ),
        TextButton(onPressed: _goToMealScreen, child: Container(
          width: 120,
          height: 50,
          decoration: BoxDecoration(color: newpurble,borderRadius: BorderRadius.circular(12)),child: Center(child: Text('Make Your Deit',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.white),)),))
          ],

        )
    );
  }
}
