import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/presentation/screens/boarding.dart';
import 'package:quiz_app/presentation/screens/question.dart';
import 'package:quiz_app/presentation/screens/result.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;

  List<String> selectedOptions = [];

  @override
  void initState() {
    activeScreen = Boarding(switchUI);
    super.initState();
  }

  void switchUI() {
    setState(() {
      activeScreen = Question(onSelectOption: chooseOption);
    });
  }

  void chooseOption(String answer) {
    selectedOptions.add(answer);

    if (selectedOptions.length == questions.length) {
      setState(() {
        activeScreen = Result(
          chosenOptions: selectedOptions,
          onRestart: restartQuiz,
        );
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedOptions = [];
      activeScreen = Question(onSelectOption: chooseOption);
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF2193b0), Color(0xFF6dd5ed)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
