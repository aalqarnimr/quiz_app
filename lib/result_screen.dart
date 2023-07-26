import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.selectedAnswers, this.resetQuiz, this.currentLanguage,
      {super.key});
  final List<String> selectedAnswers;
  final void Function() resetQuiz;
  final String currentLanguage;

  List<Map<String, Object>> getSummeryData() {
    List<Map<String, Object>> summary1 = [];

    for (var i = 0; i < selectedAnswers.length; i++) {
      summary1.add({
        "question_index": i,
        "question": questions[currentLanguage]![i].text,
        "correct_answer": questions[currentLanguage]![i].answers[0],
        "chosen_answer": selectedAnswers[i],
      });
    }
    return summary1;
  }

  @override
  Widget build(context) {
    final summaryData = getSummeryData();
    final numTotalQuestions = questions[currentLanguage]!.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data["correct_answer"] == data["chosen_answer"];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentLanguage == "English"
                  ? "You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!"
                  : "مبروك! اجبت على $numCorrectQuestions من اصل 6 أسئلة بشكل صحيح",
              style: const TextStyle(
                color: Color.fromARGB(199, 255, 255, 255),
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData, currentLanguage),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
                onPressed: resetQuiz,
                icon: const Icon(
                  Icons.refresh_outlined,
                  color: Colors.white,
                ),
                label: Text(
                  currentLanguage == "English"
                      ? 'Restart Quiz!'
                      : "أعد الاختبار",
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ))
          ],
        ),
      ),
    );
  }
}
