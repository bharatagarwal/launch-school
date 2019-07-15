function sumSquareDifference(number) {
  console.log(sumSquare(number) - squareSum(number));  
}

function sumSquare(number) {
  let num = 1;
  let sum = 0;
  for (; num <= number; num += 1) {
    sum += num;
  }

  return sum * sum;
}

function squareSum(number) {
  let num = 1;
  let sum = 0;

  for (; num <= number; num += 1) {
    sum += num * num;
  }

  return sum; 
}

sumSquareDifference(3);      // 22 --> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
sumSquareDifference(10);     // 2640
sumSquareDifference(1);      // 0
sumSquareDifference(100);    // 25164150
