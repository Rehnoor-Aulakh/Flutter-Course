import 'package:first_app/dice_roller.dart';
import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  final List<Color> colors;
  const GradientContainer(this.colors, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
        ),
      ),
      child: const Center(child: DiceRoller()),
    );
  }
}
