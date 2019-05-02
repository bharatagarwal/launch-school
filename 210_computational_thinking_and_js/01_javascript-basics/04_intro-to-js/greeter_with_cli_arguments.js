let rlSync = require('readline-sync');
let name;

if (process.argv[2] == undefined) {
  name = rlSync.question('What is your name? ');
  console.log(`Hello, ${name}`);
} else {
  console.log(`Hello, ${process.argv[2]}`);
}