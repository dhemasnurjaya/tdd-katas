import 'package:tdd_katas/bowling_game.dart';
import 'package:test/test.dart';

void main() {
  group('Bowling Game Scoring', () {
    late BowlingGame game;

    setUp(() {
      game = BowlingGame();
    });

    void rollMany(int times, int pins) {
      for (int i = 0; i < times; i++) {
        game.roll(pins);
      }
    }

    group('Basic Scoring', () {
      test('gutter game - no pins knocked', () {
        rollMany(20, 0);
        expect(game.score(), 0);
      });

      test('all ones - simple addition', () {
        rollMany(20, 1);
        expect(game.score(), 20);
      });
    });

    group('Spare Bonus (next 1 roll)', () {
      test('one spare in first frame', () {
        game.roll(5);
        game.roll(5); // spare
        game.roll(3); // bonus for spare
        rollMany(17, 0);

        expect(game.score(), 16); // 10 + 3 (bonus) + 3
      });

      test('all spares with 5 pins each', () {
        rollMany(21, 5); // 10 frames of 5,5 + 1 bonus roll
        expect(game.score(), 150);
      });
    });

    group('Strike Bonus (next 2 rolls)', () {
      test('one strike in first frame', () {
        game.roll(10); // Strike!
        game.roll(3);
        game.roll(4); // Next 2 rolls are bonus
        rollMany(16, 0);

        expect(game.score(), 24); // 10 + 3 + 4 (bonus) + 7
      });

      test('perfect game - twelve consecutive strikes', () {
        rollMany(12, 10);
        expect(game.score(), 300);
      });
    });

    group('Complex Scenarios', () {
      test('combination of strikes, spares, and normal frames', () {
        game.roll(10); // Frame 1: Strike
        game.roll(5);
        game.roll(5); // Frame 2: Spare
        game.roll(7);
        game.roll(2); // Frame 3: Normal
        rollMany(15, 0);

        // Frame 1: 10 + 5 + 5 = 20
        // Frame 2: 10 + 7 = 17
        // Frame 3: 7 + 2 = 9
        expect(game.score(), 46);
      });
    });
  });
}
