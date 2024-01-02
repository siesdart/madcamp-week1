import 'package:flutter/material.dart';

class GameInst extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
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
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: BackButton(
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned.fill(
              top: 144,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(32),
                  ),
                  color: Colors.white,
                  //border: Border.all(color: Colors.blueGrey, width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey.withOpacity(0.7),
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'How To Play\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                        ),
                      ),
                      const Text.rich(
                        TextSpan(
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text:
                              '1. Enter the answer to the given question.\n',
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
                              '    - If you get even ONE QUESTION WRONG, you will be returned to the previous level.\n        - If the current level is 1, you start from the beginning.\n',
                            ),
                            TextSpan(
                              text: '    - There are levels up to 3.',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}