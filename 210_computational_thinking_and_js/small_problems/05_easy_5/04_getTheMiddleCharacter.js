// Write a function that takes a non-empty string argument, and returns the middle character(s) of the string. If the string has an odd length, you should return exactly one character. If the string has an even length, you should return exactly two characters.

function centerOf(string) {
  if (string.length % 2 === 1) {
    return string[Math.floor(string.length / 2)];
  } else {
    let center = string.length / 2;
    return string[center - 1] + string[center];
  }
}

console.log(centerOf('I Love Ruby'));      // "e"
console.log(centerOf('Launch School'));    // " "
console.log(centerOf('Launch'));           // "un"
console.log(centerOf('Launc hs chool'));     // "hs"
console.log(centerOf('x'));                // "x"