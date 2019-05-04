function pop(array) {
  if (array.length === 0) return undefined;
  
  let last_element = array[array.length - 1];
  array.length -= 1;
  return last_element;
}

var array = [1, 2, 3];
pop(array);                        // 3
console.log(array);                // [1, 2]
pop([]);                           // undefined
pop([1, 2, ['a', 'b', 'c']]);      // ["a", "b", "c"]

function push(array, item) {
  // ~~ start with index 1, not 0
  for (let i = 1; i < arguments.length; i += 1) {
    array[array.length] = arguments[i];
  }
  return array.length;
}

var array = [1, 2, 3];
push(array, 4, 5, 6);              // 6
console.log(array);                // [1, 2, 3, 4, 5, 6]
push([1, 2], ['a', 'b']);          // 3
push([], 1);                       // 1
push([]);                          // 0