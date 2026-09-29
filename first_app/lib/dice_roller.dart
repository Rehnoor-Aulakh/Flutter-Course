import 'dart:math';

import 'package:flutter/material.dart';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});
  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var random = Random();
  // 0 to 5
  String activeDiceImage = "assets/images/dice-2.png";
  void rollDice() {
    setState(() {
      int currentNum = random.nextInt(6) + 1;
      activeDiceImage = "assets/images/dice-$currentNum.png";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          activeDiceImage,
          width: 200,
        ),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(padding: const EdgeInsets.only(top: 25)),
          child: const Text(
            "Roll Dice",
            style: TextStyle(color: Colors.white, fontSize: 28),
          ),
        )
      ],
    );
  }
}
