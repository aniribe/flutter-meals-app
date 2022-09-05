import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app_from_flutter_course/screens/favorites_screen.dart';

import 'categories_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Meals'),
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.category),
                  text: 'Categories',
                ),
                Tab(
                  icon: Icon(Icons.star),
                  text: 'Favorites',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              CategoriesScreen(),
              FavoritesScreen(),
            ],
          ),
        ));
  }
}
