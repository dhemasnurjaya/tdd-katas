import 'package:tdd_katas/bowling_game.dart';
import 'package:test/test.dart';

void main() {
  group('Bowling Game', () {
    late BowlingGame game;

    setUp(() {
      game = BowlingGame();
    });

    void rollMany(int times, int pins) {
      for (int i = 0; i < times; i++) {
        game.roll(pins);
      }
    }

    test('gutter game - all zeros', () {
      rollMany(20, 0);
      expect(game.score(), 0);
    });

    test('all ones - score is 20', () {
      rollMany(20, 1);
      expect(game.score(), 20);
    });
  });
}
