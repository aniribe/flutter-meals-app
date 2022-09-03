import 'package:flutter/material.dart';
import 'package:meal_app_from_flutter_course/widgets/category_item.dart';
import 'package:meal_app_from_flutter_course/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(25),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      children: DUMMY_CATEGORIES
          .map(
            (category) => CategoryItem(
              title: category.title,
              color: category.color,
              id: category.id,
            ),
          )
          .toList(),
    );
  }
}
