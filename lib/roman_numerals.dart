String integerToRoman(int number) {
  const conversionRules = [
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
  var remaining = number;

  for (final (value, symbol) in conversionRules) {
    while (remaining >= value) {
      result.write(symbol);
      remaining -= value;
    }
  }

  return result.toString();
}
