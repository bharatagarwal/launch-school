function myMap(array, func) {
  let transformedArray = [];
  let i;

  for (i = 0; i < array.length; i += 1) {
    transformedArray.push(func(array[i], i, array));
  }

  return transformedArray;
}

var plusOne = function (n) { return n + 1; };

console.log(myMap([1, 2, 3, 4], plusOne));       // [ 2, 3, 4, 5 ]