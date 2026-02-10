class BowlingGame {
  final List<int> _rolls = [];

  void roll(int pins) {
    _rolls.add(pins);
  }

  int score() {
    int totalScore = 0;
    int rollIndex = 0;

    for (int frame = 0; frame < 10; frame++) {
      if (_isSpare(rollIndex)) {
        totalScore += 10 + _rolls[rollIndex + 2];
        rollIndex += 2;
      } else {
        totalScore += _rolls[rollIndex] + _rolls[rollIndex + 1];
        rollIndex += 2;
      }
    }

    return totalScore;
  }

  bool _isSpare(int rollIndex) {
    return _rolls[rollIndex] + _rolls[rollIndex + 1] == 10;
  }
}
