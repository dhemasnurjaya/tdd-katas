import 'package:tdd_katas/roman_numerals.dart' as roman_numerals;
import 'package:test/test.dart';

void main() {
  test('converts 1 to I', () {
    expect(roman_numerals.integerToRoman(1), 'I');
  });
}
