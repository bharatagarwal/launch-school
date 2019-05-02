function reverse(array) {
  let returnArray = [];

  for (let i = array.length - 1; i >= 0; i-= 1) {
    returnArray.push(array[i]);
  }

  return returnArray;
}

let array = [1, 2, 3, 4, 5, 6];
console.log(reverse(array));