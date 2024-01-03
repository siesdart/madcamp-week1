import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final BorderRadius borderRadius;
  final String? hintText;
  final TextStyle? style;
  final bool keepFocus;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;

  const CustomTextField({
    this.controller,
    this.borderRadius = const BorderRadius.all(Radius.circular(32)),
    this.hintText,
    this.style,
    this.keepFocus = false,
    this.keyboardType,
    this.onChanged,
    this.onSubmitted,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: borderRadius,
    );

    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: border,
        focusedBorder: border,
        enabledBorder: border,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        hintText: hintText,
        fillColor: Colors.grey[200],
        isDense: true,
        filled: true,
      ),
      keyboardType: keyboardType,
      style: style ?? const TextStyle(fontSize: 18),
      onChanged: onChanged,
      onEditingComplete: keepFocus ? () {} : null,
      onSubmitted: onSubmitted,
    );
  }
}
