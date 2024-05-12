import 'package:flutter/material.dart';

class Input extends StatelessWidget {
   Input({super.key, required this.hintText, required this.controller, this.obscureText=false});
  final String hintText;
  final TextEditingController controller;
  bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText!,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(),
        hintText: hintText
      ),
    );
  }
}