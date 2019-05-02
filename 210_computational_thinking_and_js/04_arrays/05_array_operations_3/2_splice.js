function splice(array, startIndex, number) {
  let newArray = []
  let reducedArrayLength = array.length - number;
  let i;

  for (i = 0; i < number; i += 1) {
    newArray[i] = array[startIndex + i];
  }

  for (i = startIndex; i < reducedArrayLength; i += 1) {
    array[i] = array[i + number];
  }

  array.length = reducedArrayLength;
  return newArray;
}


var count = [1, 2, 3, 4, 5, 6, 7, 8];
console.log(splice(count, 2, 5));                   // [ 3, 4, 5, 6, 7 ]
console.log(count);                                 // [ 1, 2, 8 ]
