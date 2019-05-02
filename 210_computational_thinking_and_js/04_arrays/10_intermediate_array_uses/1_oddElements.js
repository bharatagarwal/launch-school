function oddElementsOf(arr) {
  let newArray = [];

  for (let i = 0; i < arr.length; i += 1) {
    if (i % 2 == 1) newArray.push(arr[i]);
  }

  return newArray;
}

var digits = [4, 8, 15, 16, 23, 42];

console.log(oddElementsOf(digits));    // returns [8, 16, 42]