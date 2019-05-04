// xor -> exclusive or
// write a function names isXor()
// two arguments, and returns true 
// if exactly one argument is truthy.

// (false and true) or (true and false)

function isXor(first, second) {
  let first_truthy = !!first === true;
  let first_falsy = !!first === false;
  let second_truthy = !!second === true;
  let second_falsy = !!second === false;

  return ((first_truthy && second_falsy) || (first_falsy && second_truthy));
}

cl(isXor(false, true));     // true
cl(isXor(true, false));     // true
cl(isXor(false, false));    // false
cl(isXor(true, true));      // false
cl(isXor(false, 3));        // true
cl(isXor('a', undefined));  // true
cl(isXor(null, ''));        // false
cl(isXor('2', 23));         // false