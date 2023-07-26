import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.onSelectAnswer, this.currentLanguage, {super.key});

  final void Function(String answer) onSelectAnswer;
  final String currentLanguage;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var questionNumber = 0;

  @override
  void initState() {
    questionsList.shuffle();
    super.initState();
  }

  void nextQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      questionNumber++;
    });
  }

  @override
  Widget build(context) {
    var currentQuestion =
        questions[widget.currentLanguage]?[questionNumber].text;
    var shuffledAnswers =
        questions[widget.currentLanguage]?[questionNumber].getShuffledAnswers();
    return Center(
      child: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion!,
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(170, 255, 255, 255),
                  fontSize: 20),
              // style: const TextStyle(
              //   color: Color.fromARGB(170, 255, 255, 255),
              //   fontSize: 20,
              // ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...shuffledAnswers!.map((answer) {
              return AnswerButton(answer, () {
                nextQuestion(answer);
              });
            }),
          ],
        ),
      ),
    );
  }
}
