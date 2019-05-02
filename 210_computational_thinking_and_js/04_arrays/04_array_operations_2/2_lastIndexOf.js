function lastIndexOf(array, value) {
  let indexOf = -1;
  for (let i = 0; i < array.length; i += 1) {
    if (array[i] === value) indexOf = i;
  } 

  return indexOf;
}

console.log(lastIndexOf([1, 2, 3, 3], 3));     // 3
console.log(lastIndexOf([1, 2, 3], 4));            // -1