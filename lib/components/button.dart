import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({super.key, required this.onTap, required this.text});

  final String text;
  Function onTap;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 191, 75, 75), borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          width: double.maxFinite,
          child:  Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
