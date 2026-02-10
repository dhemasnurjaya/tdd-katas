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

  test('converts 4 to IV', () {
    expect(roman_numerals.integerToRoman(4), 'IV');
  });

  test('converts 5 to V', () {
    expect(roman_numerals.integerToRoman(5), 'V');
  });

  test('converts 6 to VI', () {
    expect(roman_numerals.integerToRoman(6), 'VI');
  });

  test('converts 7 to VII', () {
    expect(roman_numerals.integerToRoman(7), 'VII');
  });

  test('converts 8 to VIII', () {
    expect(roman_numerals.integerToRoman(8), 'VIII');
  });

  test('converts 9 to IX', () {
    expect(roman_numerals.integerToRoman(9), 'IX');
  });

  test('converts 10 to X', () {
    expect(roman_numerals.integerToRoman(10), 'X');
  });

  test('converts 40 to XL', () {
    expect(roman_numerals.integerToRoman(40), 'XL');
  });

  test('converts 49 to XLIX', () {
    expect(roman_numerals.integerToRoman(49), 'XLIX');
  });

  test('converts 50 to L', () {
    expect(roman_numerals.integerToRoman(50), 'L');
  });

  test('converts 90 to XC', () {
    expect(roman_numerals.integerToRoman(90), 'XC');
  });

  test('converts 100 to C', () {
    expect(roman_numerals.integerToRoman(100), 'C');
  });

  test('converts 400 to CD', () {
    expect(roman_numerals.integerToRoman(400), 'CD');
  });

  test('converts 500 to D', () {
    expect(roman_numerals.integerToRoman(500), 'D');
  });

  test('converts 900 to CM', () {
    expect(roman_numerals.integerToRoman(900), 'CM');
  });

  test('converts 1000 to M', () {
    expect(roman_numerals.integerToRoman(1000), 'M');
  });
}
