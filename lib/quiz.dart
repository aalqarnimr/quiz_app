import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';
  List<String> selectedAnswers = [];
  String language = "English";

  void changeLanguage() {
    setState(() {
      if (language == "English") {
        language = "Arabic";
      } else {
        language = "English";
      }
    });
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void registerAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == 6) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void resetQuiz() {
    setState(() {
      selectedAnswers.clear();
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen, changeLanguage, language);
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(registerAnswer, language);
    } else if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(selectedAnswers, resetQuiz, language);
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}

