import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_details.dart';
import 'package:meals_app/widgets/meal_list_item.dart';



class MealsScreen extends StatelessWidget {
  final String? title;
  final List<Meal> meals;
  MealsScreen({
    super.key,
    this.title,
    required this.meals,
  });

  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealDetailsScreen(
          meal: meal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = meals.isEmpty
        ? Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Uh oh ... nothing here",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Try selecting a different category!",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                )
              ],
            ),
          )
        : ListView.builder(
            itemCount: meals.length,
            itemBuilder: (ctx, index) => MealListItem(
              meal: meals[index],
              onSelectMeal: () {
                _selectMeal(context, meals[index]);
              },
            ),
          );

    if (title == null) return content;
    return Scaffold(appBar: AppBar(title: Text(title!)), body: content);
  }
}
