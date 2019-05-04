function substr(string, start, length) {
  if (length === 0 || length < 0) return '';
  
  let substring = '';
  let availableLength;
  
  if (start < 0) {
    start = string.length + start;
  }

  if (start + length > string.length) {
    availableLength = string.length - start;
  } else {
    availableLength = length;
  }

  for (let i = start; i < start + availableLength; i += 1) {
    substring += string[i]
  }

  return substring;
}

var string = 'hello world';

console.log(substr(string, 2, 4));      // "llo "
console.log(substr(string, -3, 2));     // "rl"
console.log(substr(string, 8, 20));     // "rld"
console.log(substr(string, 0, -20));    // ""
console.log(substr(string, 0, 0));      // ""