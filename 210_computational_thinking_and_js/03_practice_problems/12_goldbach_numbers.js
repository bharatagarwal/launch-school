// every pair of primes that sum up to the given even number.
// if n is odd or less than 4, function should log null.

function isPrime(number) {
  if (number < 2) return false;
  
  for (var i = 2; i < number; i++) {
    if (number % i === 0) return false;
  }

  return true;
}

function checkGoldbach(number) {
  if (number < 4 || number % 2 === 1) {
    console.log(null);
    return;
  }

  let num1 = 1;
  let num2;

  do {
    num1 += 1;
    num2 = number - num1;

    if (isPrime(num1) && isPrime(num2)) {
      console.log(num1, num2);
    }
  } while (num1 !== num2);
}