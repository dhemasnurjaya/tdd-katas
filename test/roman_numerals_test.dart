import 'package:tdd_katas/roman_numerals.dart';
import 'package:test/test.dart';

void main() {
  group('Roman Numerals Conversion', () {
    group('Basic Symbols', () {
      test('smallest unit', () => expect(integerToRoman(1), 'I'));
      test('five', () => expect(integerToRoman(5), 'V'));
      test('ten', () => expect(integerToRoman(10), 'X'));
      test('fifty', () => expect(integerToRoman(50), 'L'));
      test('hundred', () => expect(integerToRoman(100), 'C'));
      test('five hundred', () => expect(integerToRoman(500), 'D'));
      test('thousand', () => expect(integerToRoman(1000), 'M'));
    });

    group('Subtractive Notation', () {
      test('four (one before five)', () => expect(integerToRoman(4), 'IV'));
      test('nine (one before ten)', () => expect(integerToRoman(9), 'IX'));
      test('forty (ten before fifty)', () => expect(integerToRoman(40), 'XL'));
      test(
        'ninety (ten before hundred)',
        () => expect(integerToRoman(90), 'XC'),
      );
      test(
        'four hundred (hundred before five hundred)',
        () => expect(integerToRoman(400), 'CD'),
      );
      test(
        'nine hundred (hundred before thousand)',
        () => expect(integerToRoman(900), 'CM'),
      );
    });

    group('Additive Combinations', () {
      test('two (repeated symbol)', () => expect(integerToRoman(2), 'II'));
      test(
        'three (maximum repetition)',
        () => expect(integerToRoman(3), 'III'),
      );
      test('six (additive after five)', () => expect(integerToRoman(6), 'VI'));
      test(
        'twenty-seven (multiple symbols)',
        () => expect(integerToRoman(27), 'XXVII'),
      );
    });

    group('Complex Edge Cases', () {
      test(
        'forty-nine (combines subtractive symbols)',
        () => expect(integerToRoman(49), 'XLIX'),
      );
      test(
        'ninety-nine (maximum two-digit complexity)',
        () => expect(integerToRoman(99), 'XCIX'),
      );
      test(
        'four hundred forty-four (all subtractive positions)',
        () => expect(integerToRoman(444), 'CDXLIV'),
      );
      test(
        '1994 (year notation stress test)',
        () => expect(integerToRoman(1994), 'MCMXCIV'),
      );
      test(
        '3999 (maximum valid Roman numeral)',
        () => expect(integerToRoman(3999), 'MMMCMXCIX'),
      );
    });
  });
}
