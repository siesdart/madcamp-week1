import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:madcamp_week1/models/game.dart';

const operators = ['+', '×', '÷', '−'];

class GameNotifier extends Notifier<Game> {
  final _random = Random();

  @override
  Game build() => Game(
        isExited: false,
        level: 1,
        stepInLevel: 1,
        results: [],
        problem: _getProblem(1),
      );

  void init() => state = build();

  GameProblem _getProblem(int level) {
    final maxInt = pow(10, level).toInt() - 1;
    var operand1 = _random.nextInt(maxInt) + 1;
    var operand2 = _random.nextInt(maxInt) + 1;
    final operator = operators[_random.nextInt(operators.length)];

    if (operator == '÷') {
      while (operand1 % operand2 != 0) {
        operand1 = _random.nextInt(maxInt) + 1;
        operand2 = _random.nextInt(maxInt) + 1;
      }
    }

    final answer = switch (operator) {
      '+' => operand1 + operand2,
      '×' => operand1 * operand2,
      '÷' => operand1 ~/ operand2,
      '−' => operand1 - operand2,
      _ => 0,
    };

    return GameProblem(
      operand1: operand1,
      operand2: operand2,
      operator: operator,
      answer: answer,
    );
  }

  bool? sendAnswer(int userAnswer) {
    final problem = state.problem;
    final isCorrect = problem.answer == userAnswer;

    var isExited = state.isExited;
    var level = state.level;
    var stepInLevel = state.stepInLevel;

    if (isCorrect) {
      if (stepInLevel++ >= 3) {
        level++;
        stepInLevel = 1;
      }

      if (level > 3) isExited = true;
    } else {
      stepInLevel = 1;
      if (level >= 2) level--;
    }

    state = Game(
      isExited: isExited,
      level: level,
      stepInLevel: stepInLevel,
      results: [
        ...state.results,
        GameResult(
          question:
              '${problem.operand1} ${problem.operator} ${problem.operand2}',
          userAnswer: userAnswer,
          correctAnswer: problem.answer,
        ),
      ],
      problem: _getProblem(level),
    );

    return isCorrect;
  }

  void exit() => state = state.copyWith(isExited: true);
}

final gameNotifierProvider =
    NotifierProvider<GameNotifier, Game>(GameNotifier.new);
