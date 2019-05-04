function substr(string, start, length) {
  let substring = '';
  let index;
  let i;
  
  if (start < 0) {
    start = string.length + start;
  }

  for (let i = 0; i < length; i += 1) {
    index = start + i;

    if (string[index] === undefined) {
      break;
    }

    substring += string[index];
  }

  return substring;
}

var string = 'hello world';

console.log(substr(string, 2, 4));      // "llo "
console.log(substr(string, -3, 2));     // "rl"
console.log(substr(string, 8, 20));     // "rld"
console.log(substr(string, 0, -20));    // ""
console.log(substr(string, 0, 0));      // ""