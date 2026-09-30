import 'package:flutter/material.dart';
import 'package:flutter_quiz/answer.dart';
import 'package:flutter_quiz/data/questions.dart';
import 'package:flutter_quiz/models/quiz_question.dart';

class ResultsScreen extends StatelessWidget {
  List<String> selectedAnswers;
  void Function() restartQuiz;
  ResultsScreen(
      {super.key, required this.selectedAnswers, required this.restartQuiz});

  @override
  Widget build(BuildContext context) {
    // for every question in questions, store the first option

    // in the widget, show first the question, then your answer if it is correct, otherwise, your answer in red, and correct answer in green

    // so we need to loop over each question, so let us create a widget out of it for a single answer
    List<Answer> answers = [];
    int correctAnswers = 0;
    for (int i = 0; i < questions.length; i++) {
      //in the same loop we can calculate the number of correct answer
      if (selectedAnswers[i] == questions[i].answers[0]) {
        correctAnswers++;
      }
      answers.add(Answer(
        question: questions[i].text,
        correctAnswer: questions[i].answers[0],
        userAnswer: selectedAnswers[i],
        questionIndex: i + 1,
      ));
    }
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "You answered ${correctAnswers} correctly out of ${questions.length} questions",
            style: const TextStyle(
                color: Color.fromARGB(255, 164, 174, 254), fontSize: 14),
          ),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
              height: 500,
              child: SingleChildScrollView(child: Column(children: answers))),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(onPressed: restartQuiz, child: Text("Restart Quiz"))
        ],
      ),
    );
  }
}
