import 'package:flutter/material.dart';
import 'package:madcamp_week1/models/game.dart';
import 'package:madcamp_week1/widgets/custom_scaffold.dart';

class GameResultScreen extends StatelessWidget {
  final List<GameResult> results;
  final VoidCallback onRestart;

  const GameResultScreen({
    required this.results,
    required this.onRestart,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final corrects = results.where((e) => e.grade).length;

    return CustomScaffold(
      title: const Text('Game Result'),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 48),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 128,
                    height: 128,
                    child: TweenAnimationBuilder<double>(
                      curve: Curves.easeInOut,
                      duration: const Duration(seconds: 1),
                      tween: Tween(begin: 0, end: corrects / results.length),
                      builder: (context, value, _) {
                        return CircularProgressIndicator(
                          backgroundColor: Colors.black26,
                          strokeWidth: 8,
                          value: value,
                        );
                      },
                    ),
                  ),
                  Text(
                    '$corrects / ${results.length}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: InteractiveViewer(
                constrained: false,
                child: DataTable(
                  columnSpacing: 16,
                  headingTextStyle: const TextStyle(fontSize: 12),
                  dataTextStyle: const TextStyle(fontSize: 12),
                  columns: const [
                    DataColumn(label: Text('#')),
                    DataColumn(label: Text('Question')),
                    DataColumn(label: Text('Grade')),
                    DataColumn(label: Text('Your Answer')),
                    DataColumn(label: Text('Correct Answer')),
                  ],
                  rows: results.indexed
                      .map<DataRow>((e) => _buildDataRow(e.$1, e.$2))
                      .toList(),
                ),
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: onRestart,
              icon: const Icon(Icons.restart_alt),
              label: const Text('Restart'),
            ),
          ],
        ),
      ),
    );
  }

  DataRow _buildDataRow(int index, GameResult result) {
    final style = TextStyle(color: result.grade ? Colors.blue : Colors.red);

    return DataRow(
      cells: [
        DataCell(
          Center(child: Text((index + 1).toString(), style: style)),
        ),
        DataCell(
          Center(child: Text(result.question, style: style)),
        ),
        DataCell(
          Center(child: Text(result.grade ? 'O' : 'X', style: style)),
        ),
        DataCell(
          Center(child: Text(result.userAnswer.toString(), style: style)),
        ),
        DataCell(
          Center(child: Text(result.correctAnswer.toString(), style: style)),
        ),
      ],
    );
  }
}
