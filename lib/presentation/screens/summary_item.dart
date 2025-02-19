import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.item, {super.key});
  final Map<String, Object> item;

  @override
  Widget build(BuildContext context) {
    final questionNumber = ((item['question_idx'] as int) + 1).toString();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 25,
            height: 25,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color:
                  item['is_correct'] as bool
                      ? const Color.fromARGB(255, 37, 113, 16)
                      : const Color.fromARGB(255, 208, 39, 6),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Text(
              questionNumber,
              style: GoogleFonts.robotoMono(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 5, top: 1),
                  child: Text(
                    item['question'] as String,
                    style: GoogleFonts.robotoSerif(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Correct Answer : ${item['user_answer'] as String}.',
                  style: GoogleFonts.robotoMono(
                    color: Colors.purple,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Your Answer : ${item['correct_answer'] as String}.',
                  style: GoogleFonts.robotoMono(
                    color: Colors.blueGrey,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
