function lastNOf(arr, count) {
  index = arr.length - count;

  if (index < 0) index = 0;
  
  return arr.slice(index);
}

var digits = [4, 8, 15, 16, 23, 42];
console.log(lastNOf(digits, 3));    // returns [16, 23, 42]