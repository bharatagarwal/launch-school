function mirroredArray(arr) {
  return arr.concat(arr.slice().reverse());
}

var digits = [4, 8, 15, 16, 23, 42];
mirroredArray(digits);  // returns [4, 8, 15, 16, 23, 42, 42, 23, 16, 15, 8, 4]