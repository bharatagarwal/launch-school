// start with lower number and divide first number;
// keep reducing number until it hits 1 and return if both are divided evenly.
// 

function divides_evenly(quotient, divisor) {
  let value = quotient / divisor;
  return (Math.floor(value) === value)
}


function gcd(first, second) {
  if (divides_evenly(first, second)) return second;

  let current = second - 1;

  while (current > 1) {
    if (divides_evenly(first, current) && divides_evenly(second, current)) {
      return current;
    }

    current -= 1;
  }

  return 1;
}

gcd(12, 4);   // 4
gcd(15, 10);  // 5
gcd(9, 2);    // 1

// 48, 18. 48 / 18 -> quotient 2, remainder 12
//         18 / 12 -> quotient 1, remainder 6
//         12 / 6 -> remainder 0