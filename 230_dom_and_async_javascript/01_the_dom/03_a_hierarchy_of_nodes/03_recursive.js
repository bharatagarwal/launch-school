function recurseAndLog(array) {
  if (array.length > 0) {
    console.log(array[0]);
    recurseAndLog(array.slice(1));
  }
}

recurseAndLog([1, 2, 3, 4, 5]);