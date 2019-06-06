// Write a function that takes a sentence string as an argument, and returns that string with every occurrence of a "number word" — 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' — converted to its corresponding digit character.

const WORDS = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']

function wordToDigit(sentence) {
  return sentence.replace(/(zero|one|two|three|four|five|six|seven|eight|nine)/g, (str) => {
    return WORDS.indexOf(str);
  });
}

function stringIntegerOf(word) {
  return WORDS.indexOf(word).toString();
}

console.log(wordToDigit('Please call me at five five five one two three four. Thanks.'));
// "Please call me at 5 5 5 1 2 3 4. Thanks."