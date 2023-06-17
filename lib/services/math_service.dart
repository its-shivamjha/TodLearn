import 'dart:math';

class MathService {
  static final Random _random = Random();

  static int generateRandomNumber(int max) {
    return _random.nextInt(max);
  }
}
