// Write a function that takes a string as an argument, and returns the string stripped of spaces from both ends. Do not remove or alter internal spaces.

// Example
// trim('  abc  ');  // "abc"
// trim('abc   ');   // "abc"
// trim(' ab c');    // "ab c"
// trim(' a b  c');  // "a b  c"
// trim('      ');   // ""
// trim('');         // ""

function trim(string) {
  var trimmed = trimLeft(string);
  trimmed = trimRight(trimmed);

  return trimmed;
}

function trimLeft(string) {
  var newString = '';
  var copyMode = false;
  var i;

  for (i = 0; i < string.length; i += 1) {
    if (string[i] !== ' ') {
      copyMode = true;
    }

    if (copyMode) {
      newString += string[i];
    }
  }

  return newString;
}

function trimRight(string) {
  var newString = '';
  var copyMode = false;
  var i;

  for (i = string.length - 1; i >= 0; i -= 1) {
    if (string[i] !== ' ') {
      copyMode = true;
    }

    if (copyMode) {
      newString = string[i] + newString;
    }
  }

  return newString;
}