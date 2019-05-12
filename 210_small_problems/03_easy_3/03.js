// What is your age? 30
// At what age would you like to retire? 70

// It's 2017. You will retire in 2057.
// You have only 40 years of work to go!

let currentAge = Number(prompt(`What is your age?`));
let retirementAge = Number(prompt(`At what age would you like to retire?`));

let currentYear = new Date().getFullYear();
console.log(`It's ${currentYear}. You will retire in ${currentYear + retirementAge - currentAge}.`);
console.log(`You have only ${retirementAge - currentAge} years of work to go!`);