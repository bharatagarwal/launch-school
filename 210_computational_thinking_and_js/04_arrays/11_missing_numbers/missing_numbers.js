function missing(sortedArray) {
  let resultArray = [];
  let first = sortedArray[0];
  let last = sortedArray[sortedArray.length - 1];

  for (let i = first + 1; i < last; i += 1) {
    if (sortedArray.includes(i) === false) {
      resultArray.push(i);
    } 
  }

  return resultArray;
}

console.log(missing([-3, -2, 1, 5]));                  // [-1, 0, 2, 3, 4]
console.log(missing([1, 2, 3, 4]));                    // []
console.log(missing([1, 5]));                          // [2, 3, 4]
console.log(missing([6]));                             // []