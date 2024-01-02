import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final BorderRadius borderRadius;
  final String? hintText;
  final TextStyle? style;
  final void Function(String)? onChanged;

  const CustomTextField({
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    this.hintText,
    this.style,
    this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: borderRadius,
    );

    return TextField(
      decoration: InputDecoration(
        border: border,
        focusedBorder: border,
        enabledBorder: border,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        hintText: hintText,
        fillColor: Colors.grey[200],
        isDense: true,
        filled: true,
      ),
      style: style,
      onChanged: onChanged,
    );
  }
}
