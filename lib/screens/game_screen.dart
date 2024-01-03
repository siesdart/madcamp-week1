// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:madcamp_week1/hooks/fluttertoast.dart';
import 'package:madcamp_week1/models/game.dart';
import 'package:madcamp_week1/providers/game.dart';
import 'package:madcamp_week1/screens/game_result_screen.dart';
import 'package:madcamp_week1/widgets/custom_scaffold.dart';
import 'package:madcamp_week1/widgets/custom_text_field.dart';
import 'package:madcamp_week1/widgets/level_indicator.dart';

class GameScreen extends HookConsumerWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fToast = useFToast();
    final answerController = useTextEditingController();
    final game = ref.watch(gameNotifierProvider);

    if (game.isExited) {
      return GameResultScreen(
        results: game.results,
        onRestart: () => ref.read(gameNotifierProvider.notifier).init(),
      );
    }

    final problem = game.problem;

    return CustomScaffold(
      title: _buildTitle(game),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton.icon(
            onPressed: () => _showHowToPlaySheet(context),
            icon: const Icon(Icons.question_mark),
            label: const Text('How to play'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${problem.operand1} ${problem.operator} ${problem.operand2} = ',
                style: const TextStyle(fontSize: 22),
              ),
              SizedBox(
                width: 200,
                child: CustomTextField(
                  controller: answerController,
                  hintText: 'Enter your answer...',
                  keepFocus: true,
                  keyboardType:
                      const TextInputType.numberWithOptions(signed: true),
                  onSubmitted: (str) {
                    final userAns = int.tryParse(str);
                    if (userAns == null) return;

                    answerController.clear();

                    final result = ref
                        .read(gameNotifierProvider.notifier)
                        .sendAnswer(userAns);

                    if (result) {
                      flutterToast(
                        fToast,
                        'Good Job!',
                        'images/game_success.png',
                      );
                    } else {
                      flutterToast(
                        fToast,
                        'Wrong Answer..',
                        'images/game_fail.png',
                      );
                    }
                  },
                ),
              ),
            ],
          ),
          ElevatedButton.icon(
            onPressed: game.results.isEmpty
                ? null
                : () => ref.read(gameNotifierProvider.notifier).exit(),
            icon: const Icon(Icons.exit_to_app),
            label: const Text('Exit'),
          ),
          Image.asset(
            'images/game_bg.png',
            width: 64,
            height: 64,
            color: Colors.white38,
            colorBlendMode: BlendMode.modulate,
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  void _showHowToPlaySheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) => Container(
        height: 320,
        padding: const EdgeInsets.all(24),
        child: const Center(
          child: Text.rich(
            TextSpan(
              style: TextStyle(fontSize: 13),
              children: [
                TextSpan(
                  text: 'How to Play\n\n',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                TextSpan(
                  text: '1. Enter the answer to the given question.\n',
                ),
                TextSpan(
                  text:
                      '2. \n    - If your answer is CORRECT, you\'ll see "Success!"\n',
                ),
                TextSpan(
                  text:
                      '    - your answer is INCORRECT, you\'ll see "Fail.."\n',
                ),
                TextSpan(
                  text:
                      '3. If you get 3 questions correct in current level, you can move on to the next level.\n',
                ),
                TextSpan(
                  text:
                      '    - If you get even ONE QUESTION WRONG, you will be returned to the previous level.\n    - If the current level is 1, you start from the beginning.\n',
                ),
                TextSpan(
                  text: '    - There are levels up to 3.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(Game game) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Calculating Game'),
        const SizedBox(height: 24),
        LevelIndicator(
          level: game.level,
          labels: const ['level1', 'level2', 'level3'],
          width: 100,
          textStyle: const TextStyle(
            color: Colors.black87,
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(height: 12),
        LevelIndicator(
          level: game.stepInLevel,
          labels: const ['1', '2', '3'],
          width: 80,
          textStyle: const TextStyle(
            color: Colors.black87,
            fontSize: 11,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }

  void flutterToast(FToast fToast, String msg, String icon) {
    fToast.showToast(
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
            Image.asset(icon, width: 100, height: 100),
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
