// Write a function that takes an array of numbers, and returns an array with the same number of elements, with each element's value being the running total from the original array.

// function runningTotal(array) {
//   let runningArray = [];
//   let total = 0;

//   for (let i = 0; i < array.length; i += 1) {
//     total += array[i];
//     runningArray.push(total);
//   }

//   return runningArray;
// }


function runningTotal(array) {
  let sum = 0;

  return array.map((element) => {
    sum += element;
    return sum;
  });
}

console.log(runningTotal([2, 5, 13]));             // [2, 7, 20]
console.log(runningTotal([14, 11, 7, 15, 20]));    // [14, 25, 32, 47, 67]
console.log(runningTotal([3]));                    // [3]
console.log(runningTotal([]));                     // []