import 'package:flutter/material.dart';
// import 'package:flutter_application_1/screens/alphabet_screen.dart';
import 'alphabet_screen.dart';
import 'words_screen.dart';

class EnglishModuleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learn English'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AlphabetScreen()),
                );
              },
              child: Text('Alphabets'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WordsScreen()),
                );
              },
              child: Text('Unjumble the words'),
            ),
          ],
        ),
      ),
    );
  }
}