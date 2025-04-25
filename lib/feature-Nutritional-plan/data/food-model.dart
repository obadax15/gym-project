class FoodItem {
  final String id;
  final String name;
  final String category;
  final String image;
  final int calories;

  FoodItem({
    required this.id,
    required this.name,
    required this.category,
    required this.image,
    required this.calories,
  });
}

final List<FoodItem> allFoodItems = [
  FoodItem(
    id: '1',
    name: 'Chicken Breast',
    category: 'Proteins',
    image: 'assets/images/Simply-Recipes-Baked-Chicken-Breasts-LEAD-10-922200d1c26141cb9aa48419f1e180b5.jpg', // example link
    calories: 165,
  ),
  FoodItem(
    id: '2',
    name: 'Salmon',
    category: 'Proteins',
    image: 'assets/images/Simply-Recipes-Baked-Chicken-Breasts-LEAD-10-922200d1c26141cb9aa48419f1e180b5.jpg', // example link
    calories: 206,
  ),
  FoodItem(
    id: '3',
    name: 'Rice',
    category: 'Carbohydrates',
    image: 'assets/images/Simply-Recipes-Baked-Chicken-Breasts-LEAD-10-922200d1c26141cb9aa48419f1e180b5.jpg', // example link
    calories: 130,
  ),
  FoodItem(
    id: '4',
    name: 'Sweet Potato',
    category: 'Carbohydrates',
    image: 'assets/images/Simply-Recipes-Baked-Chicken-Breasts-LEAD-10-922200d1c26141cb9aa48419f1e180b5.jpg', // example link
    calories: 86,
  ),
  FoodItem(
    id: '5',
    name: 'Broccoli',
    category: 'Vegetables',
    image: 'assets/images/Simply-Recipes-Baked-Chicken-Breasts-LEAD-10-922200d1c26141cb9aa48419f1e180b5.jpg', // example link
    calories: 55,
  ),
  FoodItem(
    id: '6',
    name: 'Spinach',
    category: 'Vegetables',
    image: 'assets/images/Simply-Recipes-Baked-Chicken-Breasts-LEAD-10-922200d1c26141cb9aa48419f1e180b5.jpg', // example link
    calories: 23,
  ),
];
