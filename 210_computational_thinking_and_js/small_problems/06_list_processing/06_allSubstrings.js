function substringsAtStart(string) {
  return string.split('').map((char, idx, stringArray) => 
    stringArray.slice(0, idx + 1).join(''));
}

function substrings(string) {
  return string.split('').map((element, index) => {
    return substringsAtStart(string.slice(index));
  }).flat();
}

console.log(substrings('abcde'));

// returns
[ "a", "ab", "abc", "abcd", "abcde",
  "b", "bc", "bcd", "bcde",
  "c", "cd", "cde",
  "d", "de",
  "e" ]