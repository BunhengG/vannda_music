import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final TextStyle? labelStyle;
  final TextStyle? textStyle;
  final Widget? leadingIcon;

  const CustomTextField({
    super.key,
    required this.labelText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.labelStyle,
    this.leadingIcon,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: labelStyle,
        filled: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        fillColor: Theme.of(context).colorScheme.surface,
        prefixIcon: leadingIcon,
      ),
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: textStyle ?? const TextStyle(color: Colors.black),
    );
  }
}
