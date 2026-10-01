import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_list_item.dart';

class MealsScreen extends StatelessWidget {
  final String title;
  final List<Meal> meals;
  const MealsScreen({super.key, required this.title, required this.meals});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: meals.isEmpty
            ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Uh oh ... nothing here",
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
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
                itemBuilder: (ctx, index) => MealListItem(meal: meals[index])));
  }
}
