import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int level = 1;
  int maxInt = 9;

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
            fontFamily: "Arial",
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.deepPurple,
          ),
        ),
        Text(
          'Current level: '+level.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Arial',
            fontSize: 15,
            color: Colors.black54,
          ),
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
                },
                // onChanged: (String str){
                //   userAns = str;
                //   checkAnswer(answer.toString(), userAns);
                // },
              ),
              width: 200,
            ),
          ],
        ),
        SizedBox(
          height: 200,
        ),
        Text(
          'How To Play',
          style: TextStyle(
            fontSize: 13,
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  void checkAnswer(String ans, String input){
    if(ans == input){
      flutterToast("success!");
    }
    else{
      flutterToast("fail");
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
}
