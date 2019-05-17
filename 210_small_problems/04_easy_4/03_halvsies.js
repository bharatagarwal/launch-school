// Write a function that takes an array as an argument, and returns an array that contains two elements, each of which is an array. Put the first half of the original array elements in the first element of the return value, and put the second half in the second element. If the original array contains an odd number of elements, place the middle element in the first half array.

function halvsies(array) {
  let firstArray = [];
  let secondArray = [];
  let i;

  for (i = 0; i < Math.round(array.length / 2); i += 1) {
    firstArray.push(array[i]);
  }

  for (; i < array.length; i += 1) {
    secondArray.push(array[i]);
  }

  return [firstArray, secondArray];
}

// function halvsies(array) {
//   var half = Math.ceil(array.length / 2);
//   var firstHalf = array.slice(0, half);
//   var secondHalf = array.slice(half);

//   return [firstHalf, secondHalf];
// }

console.log(halvsies([1, 2, 3, 4]));       // [[1, 2], [3, 4]]
console.log(halvsies([1, 5, 2, 4, 3]));    // [[1, 5, 2], [4, 3]]
console.log(halvsies([5]));                // [[5], []]
console.log(halvsies([]));                 // [[], []]