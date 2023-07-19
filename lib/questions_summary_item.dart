import 'package:flutter/material.dart';
import 'package:quiz_app/questions_summary_numbers.dart';

class QuestionsSummaryItem extends StatelessWidget {
  const QuestionsSummaryItem(this.data, this.currentLanguage, {super.key});
  final Map<String, Object> data;
  final String currentLanguage;

  @override
  Widget build(BuildContext context) {
    final textDirection =
        currentLanguage == "English" ? TextAlign.left : TextAlign.right;
    final isCorrectAnswer = data["chosen_answer"] == data["correct_answer"];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      textDirection:
          currentLanguage == "English" ? TextDirection.ltr : TextDirection.rtl,
      children: [
        SummaryNumbers(isCorrectAnswer, data["question_index"] as int),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                data["question"] as String,
                style: const TextStyle(color: Colors.white, fontSize: 16),
                textAlign: textDirection,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(data["chosen_answer"] as String,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 255, 141, 179),
                      fontWeight: FontWeight.bold),
                  textAlign: textDirection),
              Text(data["correct_answer"] as String,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 140, 203, 255),
                      fontWeight: FontWeight.bold),
                  textAlign: textDirection),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ],
    );
  }
}
