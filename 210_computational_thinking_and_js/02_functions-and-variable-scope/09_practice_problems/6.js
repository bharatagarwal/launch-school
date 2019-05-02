var a = 'outer';
var b = 'outer';

console.log(a); // -> outer
console.log(b); // -> outer
setScope(a); // a becomes local inside function
console.log(a); // outer
console.log(b); // inner

function setScope(foo) {
  foo = 'inner';
  b = 'inner';
}