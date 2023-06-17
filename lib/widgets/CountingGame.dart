import 'package:flutter/material.dart';

class CountingGame extends StatefulWidget {
  @override
  _CountingGameState createState() => _CountingGameState();
}

class _CountingGameState extends State<CountingGame> {
  int _count = 0; // Current count value
  int _targetCount = 5; // Target count value for the level
  int _score = 0; // Player's score
  bool _isGameOver = false; // Flag to indicate if the game is over

  void _incrementCount() {
    setState(() {
      _count++; // Increment count by 1

      if (_count == _targetCount) {
        _score++; // Increment score if the count matches the target
        _resetCount(); // Reset the count
      }

      if (_score >= 10) {
        _isGameOver = true; // Set the game over flag if the player reaches a certain score
      }
    });
  }

  void _resetCount() {
    setState(() {
      _count = 0; // Reset the count to 0
      _generateTargetCount(); // Generate a new target count for the level
    });
  }

  void _generateTargetCount() {
    // Generate a random target count between 1 and 10
    _targetCount = 1 + (DateTime.now().millisecond % 10);
  }

  void _resetGame() {
    setState(() {
      _score = 0; // Reset the score
      _isGameOver = false; // Reset the game over flag
      _resetCount(); // Reset the count
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isGameOver
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Game Over!',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              Text(
                'Final Score: $_score',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _resetGame,
                child: Text('Play Again'),
              ),
            ],
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Count: $_count',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _incrementCount,
                child: Text('Count'),
              ),
              SizedBox(height: 20),
              Text(
                'Target: $_targetCount',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              Text(
                'Score: $_score',
                style: TextStyle(fontSize: 24),
              ),
            ],
          );
  }
}
