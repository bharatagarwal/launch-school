// Write a function that takes a string, doubles every consonant character in the string, and returns the result as a new string. The function should not double vowels ('a','e','i','o','u'), digits, punctuation, or whitespace.

let VOWELS = ['a','e','i','o','u'];

function doubleConsonants(string) {
  let newString = '';
  let i;
  let currentLetter;

  for (i = 0; i < string.length; i += 1) {
    currentLetter = string[i].toLowerCase();
    if (!VOWELS.includes(currentLetter) && currentLetter >= 'a' && currentLetter <= 'z') {
      newString += string[i] + string[i];
    } else {
      newString += string[i];
    }
  }

  return newString;
}

console.log(doubleConsonants('String'));          // "SSttrrinngg"
console.log(doubleConsonants('Hello-World!'));    // "HHellllo-WWorrlldd!"
console.log(doubleConsonants('July 4th'));        // "JJullyy 4tthh"
console.log(doubleConsonants(''));                // ""