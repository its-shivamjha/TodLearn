import 'package:flutter/material.dart';
import 'dart:math';

class WordsScreen extends StatefulWidget {
  @override
  _WordJumbleGameState createState() => _WordJumbleGameState();
}

class _WordJumbleGameState extends State<WordsScreen> {
  List<String> words = ['APPLE', 'BANANA', 'ORANGE', 'MANGO', 'STRAWBERRY'];
  String jumbledWord = '';
  String correctWord = '';
  String userInput = '';
  bool isCorrect = false;

  @override
  void initState() {
    super.initState();
    generateJumbledWord();
  }

  void generateJumbledWord() {
    final randomIndex = Random().nextInt(words.length);
    correctWord = words[randomIndex];
    jumbledWord = _jumbleWord(correctWord);
  }

  String _jumbleWord(String word) {
    final characters = word.split('');
    characters.shuffle();
    return characters.join('');
  }

  void checkWord() {
    setState(() {
      isCorrect = userInput.toUpperCase() == correctWord;
    });
  }

  void resetGame() {
    setState(() {
      userInput = '';
      isCorrect = false;
      generateJumbledWord();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Word Jumble Game'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Unscramble the word:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                jumbledWord,
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                isCorrect ? 'Correct!' : '',
                style: TextStyle(fontSize: 24, color: Colors.green),
              ),
              SizedBox(height: 10),
              if (isCorrect)
                Text(
                  'The correct word is: $correctWord',
                  style: TextStyle(fontSize: 24),
                ),
              SizedBox(height: 20),
              TextField(
                onChanged: (value) {
                  setState(() {
                    userInput = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Enter your answer',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: checkWord,
                child: Text('Check'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: resetGame,
                child: Text('Reset'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: WordsScreen(),
  ));
}
