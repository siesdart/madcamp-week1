class GameResult {
  String question;
  int yourAnswer;
  int correctAnswer;

  bool get grade => yourAnswer == correctAnswer;

  GameResult({
    required this.question,
    required this.yourAnswer,
    required this.correctAnswer,
  });
}
