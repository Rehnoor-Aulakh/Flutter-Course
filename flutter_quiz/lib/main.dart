import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        body: Center(
          child: Column(
            children: [
              Image.asset("assets/images/quiz-logo.png"),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Learn Flutter the fun way!",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
