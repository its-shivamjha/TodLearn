import 'package:flutter/material.dart';
import 'dart:math';

class AdditionScreen extends StatefulWidget {
  @override
  _AdditionScreenState createState() => _AdditionScreenState();
}

class _AdditionScreenState extends State<AdditionScreen> {
  late int _num1;
  late int _num2;
  late int _answer;
  int _score = 0;
  TextEditingController _answerController = TextEditingController();
  bool _isCorrect = true;

  void _generateNumbers() {
    setState(() {
      // Generate random numbers between 1 and 10, ensuring that their sum doesn't exceed 11
      _num1 = Random().nextInt(10) + 1;
      _num2 = Random().nextInt(11 - _num1);
      _answer = _num1 + _num2;
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

  Widget _buildApples(int count) {
    return Row(
      children: List.generate(
        count,
        (index) => Icon(Icons.star, color: Colors.red, size: 32),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Addition Game'),
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
                    _buildApples(_num1),
                    SizedBox(width: 10),
                    Text(
                      '+',
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(width: 10),
                    _buildApples(_num2),
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
