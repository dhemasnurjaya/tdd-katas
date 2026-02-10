String integerToRoman(int number) {
  const romanSymbols = {7: 'VII', 6: 'VI', 5: 'V', 1: 'I'};

  if (_isSubtractiveCase(number)) {
    return romanSymbols[1]! + romanSymbols[5]!;
  }

  if (_canRepeatSymbol(number)) {
    return romanSymbols[1]! * number;
  }

  return romanSymbols[number] ?? '';
}

bool _isSubtractiveCase(int number) => number == 4;

bool _canRepeatSymbol(int number) => number < 4;
