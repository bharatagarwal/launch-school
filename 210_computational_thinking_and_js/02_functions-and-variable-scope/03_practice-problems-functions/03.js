function average(array) {
  total = 0;

  for (var i = 0, len = array.length; i < len; i+= 1) {
    console.log(array[i])
    total += array[i]
  }
  // ~~ len remains defined outside of the loop and block.  
  return total / len;
}

console.log(average([3, 7, 8, 5, 1]));