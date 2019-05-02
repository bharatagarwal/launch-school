function concat(array1, array2) {
  let newArray = [];
  let i;

  for (i = 0; i < array1.length; i += 1) {
    newArray[i] = array1[i];
  }

  for (i = array1.length; i < (array1.length + array2.length); i += 1) {
    newArray[i] = array2[i - array1.length];
  } 

  return newArray;
}

console.log(concat([1, 2, 3], [4, 5, 6]));