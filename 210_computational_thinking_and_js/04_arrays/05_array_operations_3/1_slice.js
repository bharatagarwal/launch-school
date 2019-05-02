function slice(array, startIndex, endIndex) {
  // startIndex inclusive
  // endIndex exclusive
  let newArray = [];
  let newArrayLength = endIndex - startIndex;

  for (let i = 0; i < newArrayLength; i += 1) {
    newArray[i] = array[startIndex + i]
  }

  return newArray;
}

console.log(slice([1, 2, 3, 4, 5], 0, 2));
console.log(slice(['a', 'b', 'c', 'd', 'e', 'f', 'g'], 1, 3));