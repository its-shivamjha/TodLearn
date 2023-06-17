class EnglishService {
  static List<String> getAlphabets() {
    return List<String>.generate(26, (index) => String.fromCharCode(index + 65));
  }

  static List<String> getWords() {
    return [
      'apple',
      'banana',
      'cat',
      'dog',
      'elephant',
      'flower',
      'giraffe',
      'house',
      'ice cream',
      'jungle',
      // Add more words as needed
    ];
  }
}
