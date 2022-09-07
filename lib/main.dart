import 'package:flutter/material.dart';
import 'package:meal_app_from_flutter_course/dummy_data.dart';
import 'package:meal_app_from_flutter_course/screens/category_meals_screen.dart';
import 'package:meal_app_from_flutter_course/screens/filters_screen.dart';
import 'package:meal_app_from_flutter_course/screens/meal_details_screen.dart';
import 'package:meal_app_from_flutter_course/screens/tabs_screen.dart';

import 'models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favoritedMeals = [];

  void setFilters(Map<String, bool> filtersData) {
    setState(() {
      filters = filtersData;

      availableMeals = DUMMY_MEALS.where((meal) {
        if (filters['gluten'] as bool && !meal.isGlutenFree) {
          return false;
        }
        if (filters['lactose'] as bool && !meal.isLactoseFree) {
          return false;
        }
        if (filters['vegan'] as bool && !meal.isVegan) {
          return false;
        }
        if (filters['vegetarian'] as bool && !meal.isVegetarian) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  void toggleFavorite(String mealId) {
    final existingIndex =
        favoritedMeals.indexWhere((meal) => meal.id == mealId);

    if (existingIndex >= 0) {
      setState(() {
        favoritedMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favoritedMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool isMealFavorite(String id) {
    return favoritedMeals.any((meal) => meal.id == id);
  }

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
      // home: const CategoriesScreen(),
      routes: {
        '/': (context) => TabsScreen(favoritedMeals: favoritedMeals),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(availableMeals: availableMeals),
        MealDetailsScreen.routeName: (context) => MealDetailsScreen(
            toggleFavorite: toggleFavorite, isMealFavorite: isMealFavorite),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(setFilters: setFilters, currentFilters: filters),
      },
    );
  }
}
