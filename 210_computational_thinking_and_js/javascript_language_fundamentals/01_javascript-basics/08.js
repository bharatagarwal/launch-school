function stringToSignedInteger(string) {
  let number = 0;
  let i;
  let sign = '';

  if (string[0] >= '0' && string[0] <= '9') {
    sign = '+';
    i = 0;
  } else {
    sign = string[0];
    i = 1;
  }

  for (; i < string.length; i+= 1) {
    number = number * 10 + Number(string[i])
  }

  if (sign === '-') {
    number *= -1;
  }

  return number;
}

console.log(stringToSignedInteger('4321'));      // 4321
console.log(stringToSignedInteger('-570'));      // -570
console.log(stringToSignedInteger('+100'));      // 100