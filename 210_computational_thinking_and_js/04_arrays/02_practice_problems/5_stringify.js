function stringify(array) {
  let string = ''

  for (let i = 0; i < array.length; i += 1) {
    string += String(array[i]);
  }

  return string
}

console.log(stringify([1, 'a', 4]));
console.log(stringify([1, 2, 3]));
