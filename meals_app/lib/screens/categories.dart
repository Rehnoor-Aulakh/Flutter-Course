import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatefulWidget {
  final List<Meal> availableMeals;
  const CategoriesScreen({super.key, required this.availableMeals});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      // lowerBound: 0,
      // upperBound: 1,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    // find the meals that have this category
    List<Meal> categoryMeals = [];
    for (final meal in widget.availableMeals) {
      if (meal.categories.contains(category.id)) {
        categoryMeals.add(meal);
      }
    }
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MealsScreen(
              title: category.title,
              meals: categoryMeals,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      // the child argument can be specified here like
      // child: ,
      // this is actually used to improve the performance of the app, because the widgets inside the child wont be built again
      child: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
                category: category,
                onSelectCategory: () {
                  _selectCategory(context, category);
                })
        ],
      ),
      builder: (context, child) => Padding(
        // the padding should have the top value dynamic which is between 0 and 1
        padding: EdgeInsets.only(top: 100  - _animationController.value * 100 ),
        child: child,
      ),
    );
  }
}
