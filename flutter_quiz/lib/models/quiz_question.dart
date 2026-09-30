class QuizQuestion {
  final String text;
  final List<String> answers;

  const QuizQuestion(this.text, this.answers);

  List<String> getShuffledAnswers() {
    final List<String> temp = List.from(answers);
    temp.shuffle();
    return temp;
  }
}
