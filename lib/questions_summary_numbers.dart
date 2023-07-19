import 'package:flutter/material.dart';

class SummaryNumbers extends StatelessWidget {
  const SummaryNumbers(this.isCorrect, this.questionIndex, {super.key});
  final bool isCorrect;
  final int questionIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: isCorrect
            ? const Color.fromARGB(255, 140, 203, 255)
            : const Color.fromARGB(255, 255, 141, 179),
      ),
      child: Text((questionIndex + 1).toString()),
    );
  }
}
