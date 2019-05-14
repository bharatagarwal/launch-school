// function longestWord(words) {
//   return words.reduce(longest);
// }

function longestWord(words) {
  return words.reduce((accumulator, word) => {
    return word.length >= accumulator.length ? word : accumulator;
  });
}

var longest = function (result, currentWord) {
  return currentWord.length >= result.length ? currentWord : result;
};

console.log(longestWord(['abc', 'launch', 'targets', '']));      // "targets"