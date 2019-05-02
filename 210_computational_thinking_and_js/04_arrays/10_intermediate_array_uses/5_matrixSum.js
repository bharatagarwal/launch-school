function matrixSums(arr) {
  let resultArr = [];
  let intermediateSum;

  for (let i = 0; i < arr.length; i += 1) {
    intermediateSum = 0;

    for (let j = 0; j < arr[i].length; j += 1) {
      intermediateSum += arr[i][j];
    }

    resultArr.push(intermediateSum);
  }

  return resultArr;
}

matrixSums([[2, 8, 5], [12, 48, 0], [12]]);  // returns [15, 60, 12]
