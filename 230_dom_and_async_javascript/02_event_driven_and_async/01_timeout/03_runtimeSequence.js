var q = () => console.log('q');
var d = () => console.log('d');
var n = () => console.log('n');
var z = () => console.log('z');
var s = () => console.log('s');
var f = () => console.log('f');
var g = () => console.log('g');

setTimeout(function() {
  setTimeout(function() {
    q();  // 7th
  }, 15); 

  d(); // 3rd

  setTimeout(function() {
    n(); // 5th
  }, 5); 

  z(); // 4th
}, 10);

setTimeout(function() {
  s();  // 6th
}, 20); 

setTimeout(function() {
  f(); // 2nd
});

g(); // 1st

