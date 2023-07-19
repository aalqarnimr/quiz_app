import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen(this.startQuiz, this.changeLanguage, this.currentLanguage,
      {super.key});

  final void Function() startQuiz;
  final void Function() changeLanguage;
  final String currentLanguage;

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          // Opacity(
          //   opacity: 0.6,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 300,
          //   ),
          // ),
          const SizedBox(height: 80),
          Text(
            widget.currentLanguage == "English"
                ? 'Learn Flutter the fun way!'
                : "!أختبر معرفتك",
            style: const TextStyle(
              color: Color.fromARGB(255, 237, 223, 252),
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: widget.startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: Text(widget.currentLanguage == "English"
                ? 'Start Quiz'
                : "أبدا الاختبار"),
          ),
          TextButton(
            onPressed: widget.changeLanguage,
            child: Text(
              widget.currentLanguage == "English"
                  ? "تغيير للعربية"
                  : "Change to English",
              style: const TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
