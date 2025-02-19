import 'package:flutter/material.dart';
import 'package:quiz_app/presentation/screens/summary_item.dart';

class Summary extends StatelessWidget {
  const Summary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children:
              summaryData.map((data) {
                return SummaryItem(data);
              }).toList(),
        ),
      ),
    );
  }
}
