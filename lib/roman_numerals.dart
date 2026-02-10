String integerToRoman(int number) {
  if (number == 1) {
    return 'I';
  }
  if (number == 2) {
    return 'II';
  }

  throw UnimplementedError('Conversion not implemented for $number');
}
