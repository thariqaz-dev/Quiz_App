import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Boarding extends StatelessWidget {
  const Boarding(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Image.asset(
              "assets/images/quiz_icon.png",
              height: 180,
              width: 180,
            ),
          ),
          const SizedBox(height: 30),
          Text(
            "🎮 Get ready, get set, quiz time!",
            style: GoogleFonts.robotoMono(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: () {
              startQuiz();
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.purple,
            ),
            icon: const Icon(Icons.arrow_right_alt, color: Colors.white),
            label: Text(
              "Start Quiz",
              style: GoogleFonts.robotoMono(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
