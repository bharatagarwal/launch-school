let rlSync = require('readline-sync');

let getNumber = (type) =>  Number(rlSync.question(`What is your ${type} number? `));

let multiply = (first, second) => first * second;

firstNum = getNumber('first');
secondNum = getNumber('second');

console.log(`${firstNum} * ${secondNum} = ${multiply(firstNum, secondNum)}`);