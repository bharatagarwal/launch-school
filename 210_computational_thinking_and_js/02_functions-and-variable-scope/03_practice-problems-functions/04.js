function sum(array) {
  total = 0;

  for (var i = 0, len = array.length; i < len; i+= 1) {
    total += array[i];
  }
  // ~~ len remains defined outside of the loop and block.  
  return total;
}

function average(array) {
  let total = sum(array);
  let size = array.length

  return total / size;
}

console.log(average([3, 7, 8, 5, 1]));