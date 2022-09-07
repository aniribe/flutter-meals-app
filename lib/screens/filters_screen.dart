import 'package:flutter/material.dart';
import 'package:meal_app_from_flutter_course/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function(Map<String, bool>) setFilters;
  final Map<String, bool> currentFilters;

  const FiltersScreen({
    Key? key,
    required this.setFilters,
    required this.currentFilters,
  }) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool glutenFree = false;
  bool vegetarian = false;
  bool vegan = false;
  bool lactoseFree = false;

  @override
  void initState() {
    glutenFree = widget.currentFilters['gluten'] as bool;
    vegetarian = widget.currentFilters['vegetarian'] as bool;
    vegan = widget.currentFilters['vegan'] as bool;
    lactoseFree = widget.currentFilters['lactoseFree'] as bool;

    super.initState();
  }

  Widget buildSwitchListTile(String title, String description,
      bool currentValue, Function(bool) updateValue) {
    return SwitchListTile(
      value: currentValue,
      title: Text(title),
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': glutenFree,
                'lactose': lactoseFree,
                'vegan': vegan,
                'vegetarian': vegetarian,
              };
              widget.setFilters(selectedFilters);
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                    'Gluten-free', 'Only include gluten free meals', glutenFree,
                    (value) {
                  setState(() {
                    glutenFree = value;
                  });
                }),
                buildSwitchListTile('Lactose-free',
                    'Only include lactose-free meals', lactoseFree, (value) {
                  setState(() {
                    lactoseFree = value;
                  });
                }),
                buildSwitchListTile(
                    'Vegetarian', 'Only include vegetarian meals', vegetarian,
                    (value) {
                  setState(() {
                    vegetarian = value;
                  });
                }),
                buildSwitchListTile('Vegan', 'Only include vegan meals', vegan,
                    (value) {
                  setState(() {
                    vegan = value;
                  });
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
