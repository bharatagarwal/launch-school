function anagram(word, list) {
  return list.filter(function (candidate) {
    return areAnagrams(candidate, word);
  });
}

function areAnagrams(candidate, word) {
  candidate = candidate.split('').sort();
  word = word.split('').sort();

  return candidate.every((character, index) => character === word[index]);
}

console.log(anagram('listen', ['enlists', 'google', 'inlets', 'banana']));  // [ "inlets" ]
console.log(anagram('listen', ['enlist', 'google', 'inlets', 'banana']));   // [ "enlist", "inlets" ]