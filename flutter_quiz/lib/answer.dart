import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String question;
  final String correctAnswer;
  final String userAnswer;
  final int questionIndex;

  Answer(
      {super.key,
      required this.question,
      required this.correctAnswer,
      required this.userAnswer,
      required this.questionIndex});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(80),
              ),
              color: Colors.blue),
          child: Text(
            "$questionIndex",
            style: TextStyle(fontSize: 14),
          ),
        ),
        Expanded(
          child: Column(children: [
            Text(
              question,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 20),
            // now render the correct answer and user answer
            correctAnswer == userAnswer
                ? Column(
                    children: [
                      Text(
                        "Correct Answer",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        correctAnswer,
                        style: TextStyle(color: Colors.green, fontSize: 13),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Text(
                        "Incorrect Answer",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        userAnswer,
                        style: TextStyle(color: Colors.red, fontSize: 13),
                      ),
                      Text(correctAnswer,
                          style: TextStyle(color: Colors.green, fontSize: 13))
                    ],
                  )
          ]),
        ),
      ],
    );
  }
}
