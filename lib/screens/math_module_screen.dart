import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/counting_game_screen.dart';
import '../widgets/module_button.dart';
import 'addition_screen.dart';
import 'subtraction_screen.dart';
//import 'counting_game_screen.dart'; // Import the new screen

class MathModuleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learn Maths'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ModuleButton(
              text: 'Addition',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdditionScreen()),
                );
              }, title: 'Addition',
            ),
            SizedBox(height: 20),
            ModuleButton(
              text: 'Subtraction',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SubtractionScreen()),
                );
              }, title: 'Subtraction',
            ),
            SizedBox(height: 20),
            ModuleButton(
              text: 'Counting',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CountingGameScreen()), // Navigate to CountingGameScreen
                );
              }, title: 'Counting',
            ),
          ],
        ),
      ),
    );
  }
}
