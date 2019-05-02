let rlSync = require('readline-sync')
let age = Number(rlSync.question('How old are you? '));
console.log(`You are ${age} years old.`)

for (let increment = 10; increment <= 40; increment += 10) {
  console.log(`In ${increment} years, you will be ${age + increment} years old.`);
}