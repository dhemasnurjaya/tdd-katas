String integerToRoman(int number) {
  var result = '';
  for (int i = 0; i < number; i++) {
    if (number == 5) {
      result += 'V';
      break;
    }

    result += 'I';
  }
  return result;
}
