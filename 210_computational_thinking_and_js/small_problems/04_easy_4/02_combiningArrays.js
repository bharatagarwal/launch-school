function union(first, second) {
  let newArray = [];
  let i;

  for (i= 0; i < first.length; i += 1) {
    if (newArray.indexOf(second[i]) === -1) {
      newArray.push(second[i]);
    }
  }

  for (i= 0; i < second.length; i += 1) {
    if (newArray.indexOf(second[i]) === -1) {
      newArray.push(second[i]);
    }
  }

  return newArray;
}

console.log(union([1, 3, 5], [3, 6, 9]));    // [1, 3, 5, 6, 9]
