import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app_from_flutter_course/screens/favorites_screen.dart';

import '../models/meal.dart';
import '../widgets/main_drawer.dart';
import 'categories_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoritedMeals;

  const TabsScreen({Key? key, required this.favoritedMeals}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedPageIndex = 0;

  List<Map<String, Object>>? pages;

  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    pages = [
      {
        'page': const CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoritesScreen(favoritedMeals: widget.favoritedMeals),
        'title': 'Your Favorites',
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pages?[selectedPageIndex]['title'] as String)),
      drawer: const MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: selectedPageIndex,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(Icons.category),
              label: 'Categories'),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(Icons.star),
              label: 'Favorites'),
        ],
      ),
      body: pages?[selectedPageIndex]['page'] as Widget,
    );
  }
}
