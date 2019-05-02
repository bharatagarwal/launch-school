function unshift(array, element) {
  for (let i = array.length - 1; i >= 0; i -= 1) {
    array[i + 1] = array[i];
  }

  array[0] = element;
  
  return array.length;
}

var count = [1, 2, 3];
unshift(count, 0);      // 4
count;                  // [ 0, 1, 2, 3 ]