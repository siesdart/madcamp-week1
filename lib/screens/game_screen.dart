// ignore_for_file: lines_longer_than_80_chars

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:madcamp_week1/models/game_result.dart';
import 'package:madcamp_week1/screens/game_result_screen.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final _answerController = TextEditingController();

  late FToast _fToast;
  final _random = Random();
  final _operators = ['+', '×', '÷', '−'];

  int _level = 1;
  int _cntInLevel = 0;

  bool _isExited = false;

  final List<GameResult> _gameResults = [];

  @override
  void dispose() {
    _answerController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _fToast = FToast().init(context);
  }

  @override
  Widget build(BuildContext context) {
    if (_isExited) {
      return GameResultScreen(
        results: _gameResults,
        onRestart: () {
          setState(() {
            _level = 1;
            _cntInLevel = 0;
            _gameResults.clear();
            _isExited = false;
          });
        },
      );
    }

    final maxInt = pow(10, _level).toInt() - 1;
    var operand1 = _random.nextInt(maxInt) + 1;
    var operand2 = _random.nextInt(maxInt) + 1;
    final operator = _operators[_random.nextInt(_operators.length)];

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

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: AssetImage('images/game_background1.jpg'),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 32),
              const Text(
                'Calculating Game',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Colors.blueAccent,
                ),
              ),
              Text(
                'Current level: $_level',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$operand1 $operator $operand2 = ',
                    style: const TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 180,
                    child: TextField(
                      controller: _answerController,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        isDense: true,
                        hintText: 'Enter your answer',
                      ),
                      textAlign: TextAlign.center,
                      keyboardType:
                          const TextInputType.numberWithOptions(signed: true),
                      onSubmitted: (str) {
                        final userAns = int.tryParse(str);
                        if (userAns == null) return;

                        _gameResults.add(
                          GameResult(
                            question: '$operand1 $operator $operand2',
                            yourAnswer: userAns,
                            correctAnswer: answer,
                          ),
                        );

                        setState(() {
                          checkAnswer(answer, userAns);
                          _answerController.clear();
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: _gameResults.isEmpty
                    ? null
                    : () => setState(() => _isExited = true),
                icon: const Icon(Icons.exit_to_app),
                label: const Text('Exit'),
              ),
              const SizedBox(height: 200),
              Container(
                decoration: const BoxDecoration(color: Colors.white70),
                padding: const EdgeInsets.all(12),
                child: const Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                    children: [
                      TextSpan(
                        text: 'How To Play\n',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: '1. Enter the answer to the given question.\n',
                      ),
                      TextSpan(
                        text:
                            '2.\n    2-1. If your answer is CORRECT, you\'ll see "Success!"\n',
                      ),
                      TextSpan(
                        text:
                            '    2-2. If your answer is INCORRECT, you\'ll see "Fail.."\n',
                      ),
                      TextSpan(
                        text:
                            '3. If you get 3 questions correct in current level, you can move on to the next level.\n',
                      ),
                      TextSpan(
                        text:
                            '    3-1. If you get even ONE QUESTION WRONG, you will be returned to the previous level.\n      If the current level is 1, you start from the beginning.\n',
                      ),
                      TextSpan(
                        text: '    3-2. There are levels up to 3.',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void checkAnswer(int ans, int input) {
    // role: check answer + initialize game states (ex. level, count, ...)
    if (ans == input) {
      flutterToast('Good Job!', 'images/game_success.png');

      //init status
      if (_cntInLevel++ >= 2) {
        _level++;
        _cntInLevel = 0;
      }

      if (_level > 3) _isExited = true;
    } else {
      flutterToast('Wrong Answer..', 'images/game_fail.png');

      //init status
      _cntInLevel = 0;
      if (_level >= 2) _level--;
    }
  }

  void flutterToast(String msg, String icon) {
    _fToast.showToast(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 2,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: Colors.transparent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              width: 100,
              height: 100,
            ),
            Text(
              msg,
              style: const TextStyle(
                color: Colors.blueGrey,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      toastDuration: const Duration(seconds: 1),
      gravity: ToastGravity.CENTER,
    );
  }
}
