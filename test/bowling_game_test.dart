import 'package:tdd_katas/bowling_game.dart';
import 'package:test/test.dart';

void main() {
  group('Bowling Game', () {
    test('gutter game - all zeros', () {
      final game = BowlingGame();

      for (int i = 0; i < 20; i++) {
        game.roll(0);
      }

      expect(game.score(), 0);
    });
  });
}
