import 'package:tdd_katas/roman_numerals.dart' as roman_numerals;
import 'package:test/test.dart';

void main() {
  test('converts 1 to I', () {
    expect(roman_numerals.integerToRoman(1), 'I');
  });

  test('converts 2 to II', () {
    expect(roman_numerals.integerToRoman(2), 'II');
  });

  test('converts 3 to III', () {
    expect(roman_numerals.integerToRoman(3), 'III');
  });
}
