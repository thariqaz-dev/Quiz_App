import 'package:quiz_app/models/quiz_question.dart';

const questions = [
  QuizQuestion("What is Flutter?",
  [
   "Framework", 
   "Library", 
   "Language", 
   "Database"
  ], 0),
   QuizQuestion("Who developed Dart?",
  [
   "Google", 
   "Facebook", 
   "Microsoft", 
   "Apple"
  ], 0),
   QuizQuestion("Which language is used for Flutter development?",
  [
    "Kotlin", 
    "Dart", 
    "JavaScript", 
    "Swift"
  ], 1),
   QuizQuestion("Which widget is used to create a scrollable list in Flutter?",
  [
    "ListView", 
    "Column", 
    "Row", 
    "Stack"
  ], 0),
   QuizQuestion("What is the command to create a new Flutter project?",
  [
    "flutter create project_name", 
    "flutter new project_name", 
    "flutter init project_name", 
    "flutter start project_name"
  ], 0)
];