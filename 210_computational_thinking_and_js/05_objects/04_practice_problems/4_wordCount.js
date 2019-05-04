function wordCount(string) {
  let words = string.split(' ');
  let countObject = {};

  for (word of words) {
    if (countObject[word]) {
      countObject[word] += 1;
    } else {
      countObject[word] = 1;
    }
  }

  return countObject;
}

console.log(wordCount('box car cat bag box'));  // { box: 2, car: 1, cat: 1, bag: 1 }
