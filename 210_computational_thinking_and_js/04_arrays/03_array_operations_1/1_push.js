function push(array, value) {
  array[array.length] = value;
  return array.length;
}

var count = [0, 1, 2];
push(count, 3);         // 4
count;                  // [ 0, 1, 2, 3 ]