// Write a function that takes a grocery list (a two-dimensional array) with each element containing a fruit and a quantity, and returns a one-dimensional array of fruits, in which each fruit appears a number of times equal to its quantity.

function buyFruit(array) {
  let fruitRepeat = [];

  return array.map((pair) => {
    return repeatString(pair[0], pair[1]);
  }).flat();
}

function repeatString(string, number) {
  let arrayOfRepeatedStrings = [];
  let i;
  
  for (i = number; i > 0; i-= 1) {
    arrayOfRepeatedStrings.push(string);
  }

  return arrayOfRepeatedStrings;
}

console.log(buyFruit([['apple', 3], ['orange', 1], ['banana', 2]]));
// returns ["apple", "apple", "apple", "orange", "banana", "banana"]