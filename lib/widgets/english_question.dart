import 'package:flutter/material.dart';

class EnglishQuestion extends StatelessWidget {
  final String question;

  const EnglishQuestion({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Text(
      question,
      style: TextStyle(fontSize: 20),
    );
  }
}
