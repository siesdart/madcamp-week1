import 'package:freezed_annotation/freezed_annotation.dart';

part 'game.freezed.dart';

@freezed
class Game with _$Game {
  const factory Game({
    required bool isExited,
    required int level,
    required int stepInLevel,
    required List<GameResult> results,
    required GameProblem problem,
  }) = _Game;
}

class GameProblem {
  final int operand1;
  final int operand2;
  final String operator;
  final int answer;

  const GameProblem({
    required this.operand1,
    required this.operand2,
    required this.operator,
    required this.answer,
  });
}

class GameResult {
  String question;
  int userAnswer;
  int correctAnswer;

  bool get grade => userAnswer == correctAnswer;

  GameResult({
    required this.question,
    required this.userAnswer,
    required this.correctAnswer,
  });
}
