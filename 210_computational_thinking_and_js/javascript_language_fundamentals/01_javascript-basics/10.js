function signedIntegerToString(number) {
  if (number < 0) {
    return ('-' + integerToString(-number));
  } else if (number > 0) {
    return ('+' + integerToString(number));
  } else {
    return integerToString(number);
  }
}