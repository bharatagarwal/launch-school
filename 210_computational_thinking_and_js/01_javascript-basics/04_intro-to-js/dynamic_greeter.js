let getName = (type) => {
  let rlSync = require('readline-sync');
  let name = rlSync.question(`What is your ${type} name? `);
  return name;
}

let firstName = getName('first');
let lastName = getName('last');

console.log(`Howdy ${firstName + ' ' + lastName}!`);