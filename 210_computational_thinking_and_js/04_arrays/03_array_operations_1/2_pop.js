function pop(array) {
  let last_element = array[array.length - 1];
  array.length -= 1;
  return last_element;
}

var count = [1, 2, 3];
pop(count);             // 3
count;                  // [ 1, 2 ]