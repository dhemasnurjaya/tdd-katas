String integerToRoman(int number) {
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

  if (number <= 0 || number > 3999) {
    throw ArgumentError('Number must be between 1 and 3999');
  }

  final result = StringBuffer();
  var remaining = number;

  for (final (value, symbol) in conversionRules) {
    while (remaining >= value) {
      result.write(symbol);
      remaining -= value;
    }
  }

  return result.toString();
}
