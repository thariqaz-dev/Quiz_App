import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/presentation/screens/summary.dart';

class Result extends StatelessWidget {
  const Result({
    super.key,
    required this.onRestart,
    required this.chosenOptions,
  });
  final List<String> chosenOptions;
  final void Function() onRestart;
  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summaryData = [];
    final int chosenOptionsLen = chosenOptions.length;
    for (var i = 0; i < chosenOptionsLen; i++) {
      summaryData.add({
        'question_idx': i,
        'question': questions[i].question,
        'correct_answer': questions[i].options[questions[i].correctAnswerIdx],
        'user_answer': chosenOptions[i],
        'is_correct':
            chosenOptions[i] ==
            questions[i].options[questions[i].correctAnswerIdx],
      });
    }
    return summaryData;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions =
        summaryData.where((data) {
          return data['user_answer'] == data['correct_answer'];
        }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $numCorrectQuestions out of $numTotalQuestions questions correctly !",
              style: GoogleFonts.robotoSerif(
                fontSize: 11.5,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            Summary(summaryData),
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.purple,
              ),
              icon: const Icon(Icons.refresh, color: Colors.white),
              label: Text(
                'Restart Quiz!',
                style: GoogleFonts.robotoMono(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
