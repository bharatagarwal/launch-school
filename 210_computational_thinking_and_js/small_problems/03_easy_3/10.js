function cleanedUp(word) {
  let cleanedUpWord = '';
  let i;
  let currentLetter;

  for (i = 0; i < word.length; i += 1){
    currentLetter = word[i].toLowerCase();
    if (currentLetter >= 'a' && currentLetter <= 'z') {
      cleanedUpWord += word[i];
    }
  }

  return cleanedUpWord;
}

function wordSizes(sentence) {
  let words = sentence.split(' ');
  let wordSizes = {};
  let i;
  let size;

  for (i = 0; i < words.length; i += 1) {
    size = cleanedUp(words[i]).length.toString();
    
    if (size === '0') {
      continue;
    }
    
    wordSizes[size] = wordSizes[size] || 0;
    wordSizes[size] += 1;
  }

  return wordSizes;
}

console.log(wordSizes('Four score and seven.'));                       // { "3": 1, "4": 1, "5": 2 }
console.log(wordSizes('Hey diddle diddle, the cat and the fiddle!'));  // { "3": 5, "6": 3 }
console.log(wordSizes("What's up doc?"));                              // { "5": 1, "2": 1, "3": 1 }
console.log(wordSizes(''));                                            // {}