function firstIndex(value, array) {
  let i;
  for (i = 0; i < array.length; i += 1) {
    if (value === array[i]) return i;
  }

  return -1;
}

console.log(firstIndex(2, [1, 2, 3]));
console.log(firstIndex(9, [1, 2, 3]));