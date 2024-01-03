import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final Widget? child;

  const CustomAppBar({this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(120),
        ),
        color: Theme.of(context).appBarTheme.backgroundColor,
      ),
      child: child,
    );
  }
}
