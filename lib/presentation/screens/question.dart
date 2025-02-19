import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/presentation/screens/answer_button.dart';

class Question extends StatefulWidget {
  const Question({super.key, required this.onSelectOption});

  final void Function(String answer) onSelectOption;

  @override
  State<Question> createState() {
    return _QuestionState();
  }
}

class _QuestionState extends State<Question> {
  var currentQuestionIdx = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectOption(selectedAnswer);
    setState(() {
      currentQuestionIdx++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIdx];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              style: GoogleFonts.robotoSerif(
                color: Colors.purple,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ...currentQuestion.getShuffledOptions().map((item) {
              return AnswerButton(
                onTap: () {
                  answerQuestion(item);
                },
                answerDescription: item,
              );
            }),
          ],
        ),
      ),
    );
  }
}
