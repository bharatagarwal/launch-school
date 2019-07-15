// A 'featured number' (something unique to this exercise) is an odd number that is a multiple of 7, with all of its digits occuring exactly once each. For example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

// Write a function that takes an integer as an argument, and returns the next featured number greater than the integer. Issue an error message if there is no next featured number.

/*
problem
---

find next featured number
error if none

odd mulitple of 7 with unique digits.
*/

function featured(number) {
  let startingPoint = number + 1;
  while (true) {
    if (uniqueDigits(startingPoint) && multipleOf7(startingPoint) && isOdd(startingPoint)) {
      return startingPoint;
    } else {
      startingPoint += 1;
    }
  }
}

function isOdd(number) {
  return number % 2 === 1;
}

function multipleOf7(number) {
  return number % 7 === 0;
}

function uniqueDigits(number) {
  let numbers = number.toString().split('').map(Number);
  let seen = [];

  for (let i = 0; i < numbers.length; i += 1) {
    if (seen[numbers[i]]) {
      return false;
    } else {
      seen[numbers[i]] = true;
    }
  }

  return true;
}

console.log(featured(12));           // 21
console.log(featured(20));           // 21
console.log(featured(21));           // 35
console.log(featured(997));          // 1029
console.log(featured(1029));         // 1043
console.log(featured(999999));       // 1023547
console.log(featured(999999987));    // 1023456987