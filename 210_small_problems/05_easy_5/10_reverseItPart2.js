function reverseWords(sentence){
  let words = sentence.split(' ');
  let alteredWords = [];
  let i;

  for (i = 0; i < words.length; i += 1) {
    if (words[i].length >= 5) {
      alteredWords.push(words[i].split('').reverse().join(''));
    } else {
      alteredWords.push(words[i]);
    }
  }

  return alteredWords.join(' ');
}

console.log(reverseWords('Professional'));             // "lanoisseforP"
console.log(reverseWords('Walk around the block'));    // "Walk dnuora the kcolb"
console.log(reverseWords('Launch School'));            // "hcnuaL loohcS"