import 'package:flutter/material.dart';
import 'dart:math';

class AlphabetScreen extends StatefulWidget {
  @override
  _AlphabetGuessGameState createState() => _AlphabetGuessGameState();
}

class _AlphabetGuessGameState extends State<AlphabetScreen> {
  final List<String> images = [
    'assets/apple.png',
    'assets/banana.png',
    'assets/cat.png',
    'assets/dog.png',
  ];

  final List<String> answers = ['A', 'B', 'C', 'D'];

  int currentIndex = 0;
  String currentImage = '';
  String currentAnswer = '';
  TextEditingController answerController = TextEditingController();
  bool showResult = false;
  bool isCorrect = false;

  @override
  void initState() {
    super.initState();
    generateRandomImage();
  }

  void generateRandomImage() {
    setState(() {
      currentIndex = Random().nextInt(images.length);
      currentImage = images[currentIndex];
      currentAnswer = answers[currentIndex];
      answerController.clear();
      showResult = false;
      isCorrect = false;
    });
  }

  void checkAnswer() {
    String userAnswer = answerController.text.toUpperCase();
    setState(() {
      isCorrect = userAnswer == currentAnswer;
      showResult = true;
      if (isCorrect) {
        generateRandomImage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alphabet Guess Game'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                currentImage,
                width: 200,
                height: 200,
              ),
              SizedBox(height: 20),
              Text(
                'Guess the first letter of the object:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              if (!showResult)
                Text(
                  '', // <-- Empty text to hide the answer
                  style: TextStyle(fontSize: 48),
                ),
              if (showResult)
                Text(
                  isCorrect ? 'Correct!' : 'Incorrect!',
                  style: TextStyle(
                    fontSize: 24,
                    color: isCorrect ? Colors.green : Colors.red,
                  ),
                ),
              if (showResult && isCorrect)
                Text(
                  'The answer is $currentAnswer',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.green,
                  ),
                ),
              SizedBox(height: 20),
              Container(
                width: 200,
                child: TextField(
                  controller: answerController,
                  maxLength: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24),
                  decoration: InputDecoration(
                    hintText: 'Enter your answer',
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: showResult ? generateRandomImage : checkAnswer,
                child: Text(showResult ? 'Next' : 'Check'),
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
    home: AlphabetScreen(),
  ));
}