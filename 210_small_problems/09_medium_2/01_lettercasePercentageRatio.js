/*
Write a function that takes a string, and returns an object containing the following three properties:

- the percentage of characters in the string that are lowercase letters
- the percentage of characters that are uppercase letters
- the percentage of characters that are neither

problem
---
input -> string with characters of various types
output -> object with three properties giving string representation of percent of that character, with a precision of two digits after the decimal point.

data structure
---

create arrays of matches of type uppercase, lowercase and neithercase.
return an object that uses a function for value, containing length of type and overall length.
use function to format to string version of percentage that has precision 2
*/


function letterPercentages(string) {
  let uppercaseCharacters = string.match(/[A-Z]/g) || [];
  let lowercaseCharacters = string.match(/[a-z]/g) || [];
  let neitherCharacters = string.match(/[^a-zA-Z]/g) || [];

  return {
    lowercase: getPrecisePercentage(lowercaseCharacters.length, string.length),
    uppercase: getPrecisePercentage(uppercaseCharacters.length, string.length),
    neither: getPrecisePercentage(neitherCharacters.length, string.length),
  };
}

function getPrecisePercentage(number, total) {
  return (number * 100 / total).toFixed(2);
}

console.log(letterPercentages('abCdef 123'));
// { lowercase: "50.00", uppercase: "10.00", neither: "40.00" }

console.log(letterPercentages('AbCd +Ef'));
// { lowercase: "37.50", uppercase: "37.50", neither: "25.00" }

console.log(letterPercentages('123'));
// { lowercase: "0.00", uppercase: "0.00", neither: "100.00" }