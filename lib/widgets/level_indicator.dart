import 'package:flutter/material.dart';

class LevelIndicator extends StatelessWidget {
  final int level;
  final List<String> labels;
  final double width;
  final TextStyle? textStyle;

  const LevelIndicator({
    required this.level,
    required this.labels,
    required this.width,
    this.textStyle,
    super.key,
  }) : assert(labels.length == 3, 'label must has three elements');

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * 3,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: Colors.white38,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Text(
                      labels[0],
                      style: textStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Text(
                      labels[1],
                      style: textStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Text(
                      labels[2],
                      style: textStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          AnimatedPositioned(
            top: 0,
            bottom: 0,
            width: width,
            left: (level - 1) * width,
            duration: const Duration(seconds: 2),
            curve: Curves.easeInOut,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: Colors.black12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
