// The Math.random() function returns a floating-point, pseudo-random number in the range 0–1 (inclusive of 0, but not 1) with approximately uniform distribution over that range — which you can then scale to your desired range.

// Math.random returns a random floating-point number between 0 and 1, excluding the exact value of 1. This isn't helpful on its own, since you usually want a random integer between two other integer values. 

// Create a function that takes two arguments, a minimum and a maximum value, and returns a random integer between those numbers (including both of the numbers). 

// Your solution should handle the scenario that the user inadvertently swaps the positions of the min and max values or the scenario that the min and max values are equal. You may assume that the user always provides the min and max values.

// create function to return a value between the two, both inclusive

// (Math.floor(Math.random() * (max - min + 1)) + min)
// Math.round(Math.random() * (max - min)) + min;

// min: 21, max: 77

// both inclusive
function rand1(max, min) {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

// both inclusive
function rand2(max, min) {
  return Math.round(Math.random() * (max - min)) + min;
}

// min inclusive, max not inclusive.
function rand2(max, min) {
  return Math.floor(Math.random() * (max - min)) + min;
}

let floor = [];
let round = [];

for (let i = 0; i < 500; i += 1) {
  floor.push(rand1(77, 21));
  round.push(rand2(77, 21));
};

console.log(floor.sort((a, b) => b - a).slice(0, 10));
console.log(round.sort((a, b) => b - a).slice(0, 10));