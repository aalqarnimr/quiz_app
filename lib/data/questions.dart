import 'package:quiz_app/models/quiz_questions.dart';

const questions = {
  "English": [
    QuizQuestion(
      'What are the main building blocks of Flutter UIs?',
      [
        'Widgets',
        'Components',
        'Blocks',
        'Functions',
      ],
    ),
    QuizQuestion('How are Flutter UIs built?', [
      'By combining widgets in code',
      'By combining widgets in a visual editor',
      'By defining widgets in config files',
      'By using XCode for iOS and Android Studio for Android',
    ]),
    QuizQuestion(
      'What\'s the purpose of a StatefulWidget?',
      [
        'Update UI as data changes',
        'Update data as UI changes',
        'Ignore data changes',
        'Render UI that does not depend on data',
      ],
    ),
    QuizQuestion(
      'Which widget should you try to use more often: StatelessWidget or StatefulWidget?',
      [
        'StatelessWidget',
        'StatefulWidget',
        'Both are equally good',
        'None of the above',
      ],
    ),
    QuizQuestion(
      'What happens if you change data in a StatelessWidget?',
      [
        'The UI is not updated',
        'The UI is updated',
        'The closest StatefulWidget is updated',
        'Any nested StatefulWidgets are updated',
      ],
    ),
    QuizQuestion(
      'How should you update data inside of StatefulWidgets?',
      [
        'By calling setState()',
        'By calling updateData()',
        'By calling updateUI()',
        'By calling updateState()',
      ],
    ),
  ],
  "Arabic": [
    QuizQuestion(
      'يُعدّ كُلًا من النفط، والغاز الطبيعي، والفحم مثالًا على:',
      [
        'الوقود الأحفوري.',
        'الوقود الحيوي.',
        'موارد متجددة.',
        'موارد الطاقة الحرارية الجوفية.',
      ],
    ),
    QuizQuestion('عندما ينزل الإنسان داخل بئر، ماذا سيحدث لوزنه:', [
      'ينقص قليلًا.',
      'يزيد قليلًا.',
      'يبقى كما هو.',
    ]),
    QuizQuestion(
      'كم زهرة يجب أن يزور النحل ليتمكن من جمع 450 غرامًا من شمع العسل؟',
      [
        '20 مليون.',
        '50 مليون.',
        '10 آلاف.',
        '10 آلاف.',
      ],
    ),
    QuizQuestion(
      'الباكور هو نوع من أنواع:',
      [
        'سمك التونا.',
        'الأسماك النيزكية',
        'أسماك رخامية.',
        'الأسماك الصدفية.',
      ],
    ),
    QuizQuestion(
      'لكل فعل رد فعل مساوٍ له في المقدار، يعود لأي قانون من قوانين نيوتن للحركة:',
      [
        'القانون الثالث.',
        'القانون الثاني.',
        'القانون الأول.',
      ],
    ),
    QuizQuestion(
      'يُعدّ الأسد هو الأقرب إلى أي نوع من الحيوانات الآتية:',
      [
        'الفهد.',
        'الذئب.',
        'الراكون.',
        'الكلب.',
      ],
    ),
  ]
};
