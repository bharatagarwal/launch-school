// Write a function that takes a number argument, 
// and returns true if the number is prime, or 
// false if it is not.

// You may assume that the input is 
// always a non-negative integer.

function isPrime(number) {
  if (number < 2) return false;
  
  for (var i = 2; i < number; i++) {
    if (number % i === 0) return false;
  }

  return true;
}

isPrime(1);   // false
isPrime(2);   // true
isPrime(3);   // true
isPrime(43);  // true
isPrime(55);  // false
isPrime(0);   // false