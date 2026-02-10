String integerToRoman(int number) {
  var result = '';
  for (int i = 0; i < number; i++) {
    if (number == 5) {
      result += 'V';
      return result;
    }

    if (number == 4) {
      result += 'IV';
      return result;
    }

    result += 'I';
  }
  return result;
}
