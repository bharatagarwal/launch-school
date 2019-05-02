function lastInArray(array) {
  let arrayLength = array.length;
  let finalIndex = arrayLength - 1;

  return array[finalIndex]
}

let array = [1, 2, 3, 4, 5, 6, 9]
console.log(lastInArray(array));