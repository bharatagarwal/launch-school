function shift(array) {
  if (array.length === 0) return undefined;
  
  let first_value = array[0]

  for (let i = 1; i < array.length; i += 1) {
    array[i - 1] = array[i];
  }

  array.length -= 1;

  return first_value;
}

var count = [1, 2, 3];
console.log(shift(count));           // 1
console.log(count);                  // [ 2, 3 ]