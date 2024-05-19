import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  Input(
      {super.key,
      required this.hintText,
      required this.controller,
      this.change,
      this.obscureText = false});
  final String hintText;
  final TextEditingController controller;
  bool? obscureText;
  Function? change;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: (value) {
        if (change != null) {
          change!(value);
        }
      },
      obscureText: obscureText!,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(),
          hintText: hintText),
    );
  }
}
