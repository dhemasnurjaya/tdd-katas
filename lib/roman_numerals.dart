class RomanNumeralInput {
  static const _minValue = 1;
  static const _maxValue = 3999;

  final int value;

  RomanNumeralInput(this.value) {
    if (value < _minValue || value > _maxValue) {
      throw ArgumentError(
        'Roman numeral input must be between $_minValue and $_maxValue',
      );
    }
  }
}

String integerToRoman(int number) {
  final input = RomanNumeralInput(number);

  const conversionRules = [
    (1000, 'M'),
    (900, 'CM'),
    (500, 'D'),
    (400, 'CD'),
    (100, 'C'),
    (90, 'XC'),
    (50, 'L'),
    (40, 'XL'),
    (10, 'X'),
    (9, 'IX'),
    (5, 'V'),
    (4, 'IV'),
    (1, 'I'),
  ];

  final result = StringBuffer();
  var remaining = input.value;

  for (final (value, symbol) in conversionRules) {
    while (remaining >= value) {
      result.write(symbol);
      remaining -= value;
    }
  }

  return result.toString();
}
