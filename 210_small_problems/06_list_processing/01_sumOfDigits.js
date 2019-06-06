// Write a function that takes one argument, a positive integer, and returns the sum of its digits. Do this using list processing techniques.
function sum(number) {
  return number.toString().split('').map(element => parseInt(element, 10)).reduce((sum, element) => sum + element);
}

console.log(sum(23));           // 5
console.log(sum(496));          // 19
console.log(sum(123456789));    // 45