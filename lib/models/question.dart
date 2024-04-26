class Question {
  final int index;
  final String question;
  final List<String> options;
  final int correctAnswerIndex;

  const Question({
    required this.index,
    required this.correctAnswerIndex,
    required this.question,
    required this.options,
  });
}
