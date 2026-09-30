import 'package:flutter/material.dart';
import 'package:flutter_quiz/questions_screen.dart';
import 'package:flutter_quiz/results_screen.dart';
import 'package:flutter_quiz/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  String? activeScreen;
  Widget? activeScreenWidget;

  @override
  void initState() {
    activeScreen = "start-screen";
    super.initState();
  }

  void switchScreen() {
    setState(() {
      // we need to pass in the choose answers to the next page
      if (activeScreen == "questions-screen") {
        activeScreen = "results-screen";
      } else if (activeScreen == "start-screen") {
        activeScreen = "questions-screen";
      }
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = "questions-screen";
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
  }

  @override
  Widget build(BuildContext context) {
    if (activeScreen == "start-screen") {
      activeScreenWidget = StartScreen(switchScreen);
    } else if (activeScreen == "questions-screen") {
      activeScreenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
        switchScreen: switchScreen,
      );
    } else if (activeScreen == "results-screen") {
      activeScreenWidget = ResultsScreen(
        selectedAnswers: selectedAnswers,
        restartQuiz: restartQuiz,
      );
    }
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 24, 2, 85),
        body: Center(child: activeScreenWidget),
      ),
    );
  }
}
