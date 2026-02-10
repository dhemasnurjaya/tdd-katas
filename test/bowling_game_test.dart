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

    test('one spare', () {
      game.roll(5);
      game.roll(5); // spare
      game.roll(3); // bonus for spare
      rollMany(17, 0); // rest are gutter balls

      expect(game.score(), 16); // 10 (spare) + 3 (bonus) + 3 (normal roll)
    });
  });
}
