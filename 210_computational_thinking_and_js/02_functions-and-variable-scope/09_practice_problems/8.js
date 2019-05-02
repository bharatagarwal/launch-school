var a = 'outer';

console.log(a); // outer
setScope(); // ReferenceError -> setScope only initialized, not defined
console.log(a);

var setScope = function () {
  a = 'inner';
};