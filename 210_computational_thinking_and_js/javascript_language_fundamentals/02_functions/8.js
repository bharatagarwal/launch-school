var a = [1, 2, 3];

function myValue(b) {
  b[2] += 7;
}

myValue(a); // undefined
console.log(a); // [1, 2, 10] because mutation took place on array