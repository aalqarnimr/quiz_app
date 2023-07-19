import 'package:flutter/material.dart';
import 'package:quiz_app/questions_summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, this.currentLanguage, {super.key});
  final List<Map<String, Object>> summaryData;
  final String currentLanguage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return QuestionsSummaryItem(data, currentLanguage);
          }).toList(),
        ),
      ),
    );
  }
}
