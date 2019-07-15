/*
A collection of spelling blocks has two letters per block, as shown in this list:
*/
[['B','O'], ['X','K'], ['D','Q'], ['C','P'], ['N','A'],
['G','T'], ['R','E'], ['F','S'], ['J','W'], ['H','U'],
['V','I'], ['L','Y'], ['Z','M']]
/*
This limits the words you can spell with the blocks to only those words that do not use both letters from any given block. You can also only use each block once.

Write a function that takes a word string as an argument, and returns true if the word can be spelled using the set of blocks, or false otherwise. You can consider the letters to be case-insensitive when you apply the rules.
*/

/*
input - a word in the form of a string
output - boolean that confirms whether words is a block words or not

definitions
---
a block word is one that can be spelled using the given blocks of words

rules
---
- block words cannot use both letters from a block
- each block can only be used once.

example
---

BATCH
B -> B:O block removed from future consideration
A -> N:A block removed from future consideration
T -> G:T block removed from future consideration
C -> C:P block removed from future consideration
H -> H:U block removed from future consideration

BUTCH
B -> B:O block removed from future consideration
U -> H:U block removed from future consideration
T -> G:T block removed from future consideration
C -> C:P block removed from future consideration
H -> no block present to allow for word to be present.

data structures
---

create an array with available blocks
for each character of word, iterate through available blocks and identify block
  - find index of block character, and update array so that  from which item at index is removed.
  - move on to next character, and return false if you can't find an available block for the character.
if you've gone through the whole word, and have found a block for each character, return true.
*/

function isBlockWord(word) {
  let characters = word.toUpperCase().split('');
  let availableBlocks = [
    ['B','O'], ['X','K'], ['D','Q'], ['C','P'], ['N','A'],
    ['G','T'], ['R','E'], ['F','S'], ['J','W'], ['H','U'],
    ['V','I'], ['L','Y'], ['Z','M']
  ];
  let indexOfCurrentElement;


  for (let i = 0; i < characters.length; i += 1) {
    let currentBlock = availableBlocks.filter((block) => block.includes(characters[i]));

    availableBlocks.forEach((block, index) => {
      if (block.includes(characters[i])) {
        indexOfCurrentElement = index;
      }
    });

    if (currentBlock.length === 0) {
      return false;
    } else {
      availableBlocks.splice(indexOfCurrentElement, 1);
    }
  }

  return true;
}

console.log(isBlockWord('BATCH'));      // true
console.log(isBlockWord('BUTCH'));      // false
console.log(isBlockWord('jest'));       // true