import 'package:flutter/material.dart';

class ModuleButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const ModuleButton({super.key, 
    required this.title,
    required this.onPressed, required String text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(title),
    );
  }
}
