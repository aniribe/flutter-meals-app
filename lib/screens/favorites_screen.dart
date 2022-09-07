import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoritedMeals;

  const FavoritesScreen({Key? key, required this.favoritedMeals})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favoritedMeals.isEmpty) {
      return const Scaffold(
        body: Center(
          child: Text('You have no favorites yet - start adding some'),
        ),
      );
    } else {
      return ListView.builder(
          itemCount: favoritedMeals.length,
          itemBuilder: (context, index) {
            return MealItem(
              id: favoritedMeals[index].id,
              title: favoritedMeals[index].title,
              imageUrl: favoritedMeals[index].imageUrl,
              duration: favoritedMeals[index].duration,
              affordability: favoritedMeals[index].affordability,
              complexity: favoritedMeals[index].complexity,
            );
          });
    }
  }
}
