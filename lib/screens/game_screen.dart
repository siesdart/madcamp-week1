import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:madcamp_week1/models/game_result.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int level = 1;
  int cntInLev = 0;

  final List<GameResult> gameResult = [];

  late FToast fToast;

  void initState(){
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    int operand1, operand2;
    String operator;
    final List<String> operators = ['+', '×', '÷', '−'];
    int answer = 0;
    String userAns = '';
    int maxInt = 9;
    if(level == 1){
      maxInt = 9;
    }
    else if(level == 2){
      maxInt = 99;
    }
    else if(level == 3){
      maxInt = 999;
    }

    operand1 = Random().nextInt(maxInt) + 1;
    operand2 = Random().nextInt(maxInt) + 1;
    final random = Random();
    operator = (operators.toList()
      ..shuffle()).first;
    if (operator == '+') {
      answer = operand1 + operand2;
    }
    else if (operator == '×') {
      answer = operand1 * operand2;
    }
    else if (operator == '÷') {
      while(operand1 % operand2 != 0){
        operand1 = Random().nextInt(maxInt) + 1;
        operand2 = Random().nextInt(maxInt) + 1;
      }
      answer = (operand1 / operand2).toInt();
    }
    else if (operator == '−') {
      answer = operand1 - operand2;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Calculating Game',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.deepPurple,
          ),
        ),
        Text(
          'Current level: '+level.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            color: Colors.black54,
          ),
        ),
        SizedBox(
            height: 30
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              operand1.toString(),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              operator,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              operand2.toString(),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "=",
              style:TextStyle(
                fontSize: 20,
              ),
            ),
            Container(
              child: TextField(
                style: TextStyle(fontSize: 15, color: Colors.black),
                decoration: InputDecoration(hintText: 'Enter your answer here.'),
                textAlign: TextAlign.center,
                onSubmitted: (String str){
                  setState(() {
                    userAns = str;
                    checkAnswer(answer.toString(), userAns);
                  });
                  addToGameResult(operand1.toString(), operand2.toString(), operator, int.parse(userAns), answer);
                },
              ),
              width: 200,
            ),
          ],
        ),
        SizedBox(
          height: 50,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.deepPurple[50],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'How To Play',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                  '1. Enter the answer to the given question.',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black54,
                  ),
              ),
              Text(
                '2.\n    2-1. If your answer is CORRECT, you\'ll see \"Success!\"',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black54,
                ),
              ),
              Text(
                '    2-2. If your answer is INCORRECT, you\'ll see \"Fail..\"',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black54,
                ),
              ),
              Text(
                '3. If you get 3 questions correct in current level, you can move on to the next level.',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black54,
                ),
              ),
              Text(
                '    3-1. If you get even ONE QUESTION WRONG, you will be returned to the previous level.\n      If the current level is 1, you start from the beginning.',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black54,
                ),
              ),
              Text(
                '    3-2. There are levels up to 3.',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void checkAnswer(String ans, String input){
    // role: check answer + initialize game states (ex. level, count, ...)
    if(ans == input){
      flutterToast("Success!");

      //init status
      ++cntInLev;
      if(cntInLev >= 3){
        ++level;
        cntInLev = 0;
      }
    }
    else{
      flutterToast("Fail..");

      //init status
      cntInLev = 0;
      if(level>=2){
        --level;
      }
    }
  }

  flutterToast(String msg){
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 2.0),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
        color: Colors.deepPurple[200],
      ),
      child: Text(msg, style: TextStyle(color: Colors.deepPurple, fontSize: 20),),
    );

    fToast.showToast(
      child: toast,
      toastDuration: Duration(seconds: 1),
      gravity: ToastGravity.CENTER
    );
  }

  void addToGameResult(String num1, String num2, String op, int input, int ans){
    String question = num1 + ' ' + op + ' ' + num2;
    setState(() {
      gameResult.add(new GameResult(question: question, yourAnswer: input, correctAnswer: ans));
    });
  }
}
