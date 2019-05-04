function logMultiples(number) {
  for (let i = 100; i >= 1; i-= 1) {
    if (i % number === 0 && i % 2 === 1) console.log(i);
  }
}

// log all odd multiples of number between 0 and 100 that are
// also odd,

logMultiples(17);
logMultiples(21);