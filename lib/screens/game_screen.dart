// ignore_for_file: lines_longer_than_80_chars

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:madcamp_week1/models/game_result.dart';
import 'package:madcamp_week1/screens/game_result_screen.dart';
import 'package:madcamp_week1/screens/game_instruction_screen.dart';

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

    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: 192,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(120),
              ),
              color: Colors.indigoAccent,
            ),
          ),
        ),
        Positioned(
          child: SingleChildScrollView(
            child: Column(
              children: [
                //const SizedBox(height: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    const Text(
                      'Calculating Game',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 5.0,
                            color: Colors.grey,
                            offset: Offset(1.0, 1.0),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      width: 400,
                      height: 40,
                      color: Colors.transparent,
                      alignment: Alignment.center,
                      child: Scaffold(
                        backgroundColor: Colors.transparent,
                        body: Stack(
                          children: [
                            Positioned(
                              left: 30,
                              right: 30,
                              child: Container(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                ),
                                width: 300,
                                height: 30,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  color: Colors.white38,
                                ),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'level1',
                                      style: TextStyle(
                                          //fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Text(
                                      'level2',
                                      style: TextStyle(
                                          //fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Text(
                                      'level3',
                                      style: TextStyle(
                                          //fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            AnimatedPositioned(
                              top: 0,
                              left: (_level == 1)
                                  ? 30
                                  : (_level == 2)
                                      ? 150
                                      : (_level == 3)
                                          ? 263
                                          : 0,
                              duration: const Duration(seconds: 2),
                              curve: Curves.ease,
                              child: Container(
                                width: 100,
                                height: 30,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  color: Colors.black12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 300,
                      height: 18,
                      color: Colors.transparent,
                      alignment: Alignment.center,
                      child: Scaffold(
                        backgroundColor: Colors.transparent,
                        body: Stack(
                          children: [
                            Positioned(
                              left: 30,
                              right: 30,
                              child: Container(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                ),
                                width: 300,
                                height: 18,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                                  color: Colors.white38,
                                ),
                                child: const Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '1',
                                      style: TextStyle(
                                        //fontWeight: FontWeight.bold,
                                        fontSize: 11
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      '2',
                                      style: TextStyle(
                                        //fontWeight: FontWeight.bold,
                                          fontSize: 11
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      '3',
                                      style: TextStyle(
                                        //fontWeight: FontWeight.bold,
                                          fontSize: 11
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            AnimatedPositioned(
                              top: 0,
                              left: (_cntInLevel == 0)
                                  ? 30
                                  : (_cntInLevel == 1)
                                  ? 110
                                  : (_cntInLevel == 2)
                                  ? 190
                                  : 0,
                              duration: const Duration(seconds: 2),
                              curve: Curves.ease,
                              child: Container(
                                width: 80,
                                height: 18,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                                  color: Colors.black12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 50,),
                    ElevatedButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => GameInst(),
                          ),);
                          GameInst();
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.white),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.symmetric(horizontal: 10, vertical : 0,)
                          ),
                        ),
                        child:
                            const Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.question_mark),
                                Text(
                                  'How to play',
                                  style: TextStyle(
                                    color: Colors.indigo,
                                  ),
                                ),
                              ],
                            ),
                    ),
                    const SizedBox(height: 60),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '$operand1 $operator $operand2 = ',
                          style: const TextStyle(
                              fontSize: 22,
                          ),
                        ),
                        SizedBox(
                          width: 180,
                          child: TextField(
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            decoration: const InputDecoration(
                              isDense: true,
                              hintText: 'Enter your answer',
                            ),
                            textAlign: TextAlign.center,
                            onSubmitted: (str) {
                              final userAns = int.tryParse(str);
                              if (userAns == null) return;

                              setState(() {
                                checkAnswer(answer, userAns);
                                _gameResults.add(
                                  GameResult(
                                    question: '$operand1 $operator $operand2',
                                    yourAnswer: userAns,
                                    correctAnswer: answer,
                                  ),
                                );
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 60),
                    ElevatedButton.icon(
                      onPressed: _gameResults.isEmpty
                          ? null
                          : () => setState(() => _isExited = true),
                      icon: const Icon(Icons.exit_to_app),
                      label: const Text(
                          'Exit',
                        style: TextStyle(
                          color: Colors.indigo,
                        ),
                      ),
                    ),
                    const SizedBox(height: 100),
                    Image.asset(
                      'images/game_bg.png',
                      width: 60,
                      height: 60,
                      color: const Color.fromRGBO(255, 255, 255, 0.4),
                      colorBlendMode: BlendMode.modulate,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
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
