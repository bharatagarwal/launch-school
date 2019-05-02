var a = 7;

function myValue(b) {
  b += 10;
}

myValue(a); // ~~changes local~~ primitive therefore no mutation
console.log(a); // 7

