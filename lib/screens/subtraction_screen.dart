import 'package:flutter/material.dart';
import 'dart:math';

class SubtractionScreen extends StatefulWidget {
  @override
  _SubtractionScreenState createState() => _SubtractionScreenState();
}

class _SubtractionScreenState extends State<SubtractionScreen> {
  late int _num1;
  late int _num2;
  late int _answer;
  int _score = 0;
  TextEditingController _answerController = TextEditingController();
  bool _isCorrect = true;

  void _generateNumbers() {
    setState(() {
      // Generate random numbers between 1 and 10
      _num1 = Random().nextInt(10) + 1;
      _num2 = Random().nextInt(_num1) + 1;
      _answer = _num1 - _num2;
      _answerController.clear();
      _isCorrect = true;
    });
  }

void _checkAnswer() {
  int userAnswer = int.tryParse(_answerController.text) ?? 0;
  bool isCorrect = userAnswer == _answer;
  setState(() {
    _isCorrect = isCorrect;
    if (isCorrect) {
      _score++;
      _generateNumbers();
    }
  });
}


  @override
  void initState() {
    super.initState();
    _generateNumbers();
  }

  Widget _buildHomes(int count) {
    return Row(
      children: List.generate(
        count,
        (index) => Icon(Icons.home, color: Colors.brown, size: 32),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subtraction Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildHomes(_num1),
                    SizedBox(width: 10),
                    Text(
                      '-',
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(width: 10),
                    _buildHomes(_num2),
                    SizedBox(width: 10),
                    Text(
                      '=',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 60,
                  child: TextField(
                    controller: _answerController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _checkAnswer,
                  child: Text('Check'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Score: $_score',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 10),
            Text(
              _isCorrect ? '' : 'Incorrect!',
              style: TextStyle(
                fontSize: 18,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}