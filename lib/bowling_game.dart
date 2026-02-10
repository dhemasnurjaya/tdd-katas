class BowlingGame {
  static const _totalFrames = 10;
  static const _allPins = 10;
  static const _rollsInNormalFrame = 2;
  static const _rollsInStrike = 1;

  final List<int> _rolls = [];

  void roll(int pins) => _rolls.add(pins);

  int score() {
    int total = 0;
    int rollIndex = 0;

    for (int frame = 0; frame < _totalFrames; frame++) {
      if (_isStrike(rollIndex)) {
        total += _strikeScore(rollIndex);
        rollIndex += _rollsInStrike;
      } else if (_isSpare(rollIndex)) {
        total += _spareScore(rollIndex);
        rollIndex += _rollsInNormalFrame;
      } else {
        total += _normalScore(rollIndex);
        rollIndex += _rollsInNormalFrame;
      }
    }

    return total;
  }

  int _strikeScore(int rollIndex) {
    return _allPins + _nextTwoRollsBonus(rollIndex);
  }

  int _spareScore(int rollIndex) {
    return _allPins + _nextRollBonus(rollIndex);
  }

  int _normalScore(int rollIndex) {
    return _rolls[rollIndex] + _rolls[rollIndex + 1];
  }

  int _nextTwoRollsBonus(int rollIndex) {
    return _rolls[rollIndex + 1] + _rolls[rollIndex + 2];
  }

  int _nextRollBonus(int rollIndex) {
    return _rolls[rollIndex + 2];
  }

  bool _isSpare(int rollIndex) {
    return _rolls[rollIndex] + _rolls[rollIndex + 1] == _allPins;
  }

  bool _isStrike(int rollIndex) {
    return _rolls[rollIndex] == _allPins;
  }
}
