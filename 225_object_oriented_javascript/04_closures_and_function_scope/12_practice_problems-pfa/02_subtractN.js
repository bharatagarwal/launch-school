function subtract(a, b) {
  return a - b;
}

function makeSubN(n) {
  return function(a) {
    return subtract(a, n);
  }
}

var sub5 = makeSubN(5);
console.log(sub5(10)); // 5