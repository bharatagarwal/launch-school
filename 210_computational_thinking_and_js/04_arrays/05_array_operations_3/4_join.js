function join(array, string) {
  let newString = '';
  let i;

  for (i = 0; i < array.length; i += 1) {
    newString += String(array[i])

    if (i < array.length - 1) newString += string;
  }


  return newString;
}

console.log(join(['bri', 'tru', 'wha'], 'ck '));
console.log(join([1, 2, 3], ' and '));