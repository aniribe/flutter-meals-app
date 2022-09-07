import 'package:flutter/material.dart';
import 'package:meal_app_from_flutter_course/widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  const CategoryMealsScreen({
    Key? key,
    required this.availableMeals,
  }) : super(key: key);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? categoryTitle;
  List<Meal>? displayedMeals;
  bool loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;

      final String categoryId = routeArgs['id'] as String;
      categoryTitle = routeArgs['title'] as String;
      displayedMeals = widget.availableMeals
          .where((meal) => meal.categoryIds.contains(categoryId))
          .toList();
      loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  void removeMeal(String mealId) {
    setState(() {
      displayedMeals?.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle as String),
      ),
      body: ListView.builder(
          itemCount: displayedMeals?.length,
          itemBuilder: (context, index) {
            return MealItem(
              id: displayedMeals?[index].id as String,
              title: displayedMeals?[index].title as String,
              imageUrl: displayedMeals?[index].imageUrl as String,
              duration: displayedMeals?[index].duration as int,
              affordability:
                  displayedMeals?[index].affordability as Affordability,
              complexity: displayedMeals?[index].complexity as Complexity,
            );
          }),
    );
  }
}
