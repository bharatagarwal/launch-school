// What is the bill? 200
// What is the tip percentage? 15

// The tip is $30.00
// The total is $230.00

let bill = Number(prompt('What is the bill?'));
let tipPercentage = Number(prompt('What is the tip percentage?'));
let tip = bill * tipPercentage / 100;

console.log(`The tip is $${tip.toFixed(2)}.`)
console.log(`The total is $${(bill + tip).toFixed(2)}.`)