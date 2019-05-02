function uniqueElements(arr) {
  let resultArr = [];

  for (let i = 0; i < arr.length; i += 1) {
    if (resultArr.includes(arr[i]) === false) {
      resultArr.push(arr[i]);
    }
  }

  return resultArr;
}

uniqueElements([1, 2, 4, 3, 4, 1, 5, 4]);  // returns [1, 2, 4, 3, 5]