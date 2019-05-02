var a = 7;

function myValue(a) {
  a += 10;
}

myValue(a); // shadowed
console.log(a); // no change