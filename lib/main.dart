import 'package:flutter/material.dart';
import 'package:meal_app_from_flutter_course/categories_screen.dart';
import 'package:meal_app_from_flutter_course/category_meals_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
            ),
      ),
      home: const CategoriesScreen(),
      routes: {'/category-meals': (context) => const CategoryMealsScreen()},
    );
  }
}
