import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealListItem extends StatelessWidget {
  final Meal meal;
  const MealListItem({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // first render the image
        Image.network(meal.imageUrl)
      ],
    );
  }
}
