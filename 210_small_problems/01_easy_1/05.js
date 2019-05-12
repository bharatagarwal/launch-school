// Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or the product of all numbers between 1 and the entered integer, inclusive.

// Please enter an integer greater than 0: 5
// Enter "s" to compute the sum, or "p" to compute the product. s

// The sum of the integers between 1 and 5 is 15.
// Please enter an integer greater than 0: 6
// Enter "s" to compute the sum, or "p" to compute the product. p

// The product of the integers between 1 and 6 is 720.

let integer = parseInt(prompt(`Please enter an integer greater than 0:`), 10);
let choice = prompt('Enter "s" to compute the sum, or "p" to compute the product.');
let answer;
let i;

if (choice === 'p') {
  answer = 1;
  for (i = 1; i <= integer; i += 1) {
    answer *= i
  }
} else if (choice === 's') {
  answer = 0;
  for (i = 1; i <= integer; i += 1) {
    answer += i
  }
}

console.log(`The ${choice === 'p' ? 'product' : 'sum'} of the integers between 1 and ${integer} is ${answer}.`)