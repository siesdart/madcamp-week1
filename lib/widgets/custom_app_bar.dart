import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final Widget? child;

  const CustomAppBar({this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(120),
        ),
        color: Colors.indigoAccent,
      ),
      child: child,
    );
  }
}
