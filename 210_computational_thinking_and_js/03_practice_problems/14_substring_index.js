/*
The indexOf() function searches for the first instance of a substring in firstString that matches the string secondString, and returns the index of the character where that substring begins.

The lastIndexOf() function searches for the last instance of a substring in firstString that matches the string secondString, and returns the index of the character where that substring begins.
*/

/* algorithm

Assume that the first string's length is m and the second string's length is n.
Iterate from the beginning of the first string and work to the end.
During each iteration:
Compare the n characters starting at the current position in the first string with the n characters of the second string.
If all n characters match, return the index of the current character in the first string
Otherwise, continue iteration.
The last character we need to check in the first string is the character at index m - n.
Return -1 if you cannot find the second string in the first string.

*/

function indexOf(firstString, secondString) {
  if (secondString.length > firstString.length) return -1;

  let differenceInLength = firstString.length - secondString.length
  let match;

  for (let i = 0; i <= differenceInLength; i += 1) {
    match = true;

    for (let j = 0; j < secondString.length; j += 1) {
      if (firstString[i + j] !== secondString[j]) {
        match = false;
        break;
      }
    }

    debugger;

    if (match === true) return i;
  }

  return -1;
}

console.log(indexOf('Some strings', 's'));                      // 5
console.log(indexOf('Blue Whale', 'Whale'));                    // 5
console.log(indexOf('Blue Whale', 'Blute'));                    // -1
console.log(indexOf('Blue Whale', 'leB'));                      // -1

function lastIndexOf(firstString, secondString) {
  if (secondString.length > firstString.length) return -1;

  let differenceInLength = firstString.length - secondString.length
  let match;
  let last_match_index = -1;

  for (let i = 0; i <= differenceInLength; i += 1) {
    match = true;

    for (let j = 0; j < secondString.length; j += 1) {
      if (firstString[i + j] !== secondString[j]) {
        match = false;
        break;
      }
    }

    debugger;

    if (match === true) last_match_index = i;
  }

  return last_match_index;
}

console.log(lastIndexOf('Some strings', 's'));                  // 11
console.log(lastIndexOf('Blue Whale, Killer Whale', 'Whale'));  // 19
console.log(lastIndexOf('Blue Whale, Killer Whale', 'all'));    // -1