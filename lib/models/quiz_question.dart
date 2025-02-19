class QuizQuestion {

  const QuizQuestion(this.question, this.options, this.correctAnswerIdx);

  final String question;
  final List<String> options;
  final int correctAnswerIdx;

  List<String> getShuffledOptions() {
    List<String> shuffledList = List.of(options);
    shuffledList.shuffle();
    return shuffledList;
  }
}