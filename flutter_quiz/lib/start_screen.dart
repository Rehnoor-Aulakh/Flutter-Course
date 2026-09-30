import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  final void Function() switchScreen;
  const StartScreen(this.switchScreen, {super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset("assets/images/quiz-logo.png",
            width: 300, color: const Color.fromARGB(150, 255, 255, 255)),
        const SizedBox(
          height: 80,
        ),
        const Text(
          "Learn Flutter the fun way!",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        const SizedBox(
          height: 28,
        ),
        OutlinedButton.icon(
          onPressed: switchScreen,
          label: const Text("Start Quiz"),
          style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
          icon: const Icon(Icons.arrow_right_alt),
        )
      ],
    );
  }
}
