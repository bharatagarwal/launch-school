function swap(sentence) {
  return sentence.split(' ').map((word) => {
    let chars = word.split('');
    let length = word.length;
    [chars[0], chars[chars.length - 1]] = [chars[chars.length - 1], chars[0]];
    return chars.join('');
  }).join(' ');
}

console.log(swap('Oh what a wonderful day it is'));  // "hO thaw a londerfuw yad ti si"
console.log(swap('Abcde'));                          // "ebcdA"
console.log(swap('a'));                              // "a"