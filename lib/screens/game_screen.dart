import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int level = 1;

  @override
  Widget build(BuildContext context) {
    int operand1, operand2;
    String operator;
    int answer;

    return Column(
      children: [
        Row(
          children: [],
        ),
        TextField(),
      ],
    );
  }
}
