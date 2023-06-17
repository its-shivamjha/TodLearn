import 'package:flutter/material.dart';

class MathQuestion extends StatelessWidget {
  final String question;

  const MathQuestion({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Text(
      question,
      style: TextStyle(fontSize: 20),
    );
  }
}
