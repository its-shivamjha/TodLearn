import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/CountingGame.dart';

class CountingGameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counting Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CountingGame(), // Add the CountingGame widget
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add logic to navigate to the next level or show rewards
              },
              child: Text('Next Level'),
            ),
          ],
        ),
      ),
    );
  }
}

