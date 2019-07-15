// function substringsAtStart(string) {
//   let substrings = [];

//   string.split('').forEach((_, index) => {
//     substrings.push(string.slice(0, index + 1));
//   });

//   return substrings;
// }

function substringsAtStart(string) {
  return string.split('').map((char, idx, stringArray) => 
    stringArray.slice(0, idx + 1).join(''));
}

console.log(substringsAtStart('abc'));      // ["a", "ab", "abc"]
console.log(substringsAtStart('a'));        // ["a"]
console.log(substringsAtStart('xyzzy'));    // ["x", "xy", "xyz", "xyzz", "xyzzy"]