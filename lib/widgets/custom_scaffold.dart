import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget title;
  final Widget body;
  final double height;

  const CustomScaffold({
    required this.title,
    required this.body,
    this.height = 192,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      child: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: height,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(120),
                  ),
                  color: theme.appBarTheme.backgroundColor,
                ),
                child: Center(
                  child: DefaultTextStyle(
                    style: theme.textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ) ??
                        const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    child: title,
                  ),
                ),
              ),
            ),
            if (ModalRoute.of(context)?.impliesAppBarDismissal ?? false)
              Align(
                alignment: Alignment.topLeft,
                child: BackButton(
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            Positioned.fill(
              top: height - 24,
              child: body,
            ),
          ],
        ),
      ),
    );
  }
}
