function combinedArray(even, odd) {
  var combined = [];
  var len = even.length;
  var i;

  for (i = 0; i < len; i += 1) {
    combined.push(even[i]);
    combined.push(odd[i]);
  }

  return combined;
}

var digits = [4, 8, 15, 16, 23, 42];
var letters = ['A', 'L', 'V', 'A', 'R', 'H'];

combinedArray(digits, letters);  // returns [4, "A", 8, "L", 15, "V", 16, "A", 23, "R", 42, "H"]