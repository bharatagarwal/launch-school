// Write a function that takes a string, doubles every character in the string, and returns the result as a new string.

function repeater(string) {
  let newString = '';
  let i = 0;

  for (i = 0; i < string.length; i += 1) {
    newString += string[i] + string[i]
  }

  return newString;
}

console.log(repeater('Hello'));        // "HHeelllloo"
console.log(repeater('Good job!'));    // "GGoooodd  jjoobb!!"
console.log(repeater(''));             // ""