// For this exercise we're going to learn more about type conversion by implementing our own parseInt function that converts a string of numeric characters (including an optional plus or minus sign) to a number.

// The function takes a string of digits as an argument, and returns the appropriate number. Do not use any of the built-in functions for converting a string to a number type.

// For now, do not worry about leading + or - signs, nor should you worry about invalid characters; assume all characters will be numeric.

function stringToInteger(string) {
  let number = 0;
  let i;


  for (i = 0; i < string.length; i+= 1) {
    number = number * 10 + Number(string[i])
  }

  return number;
}

console.log(stringToInteger('4321'));      // 4321
console.log(stringToInteger('570'));       // 570