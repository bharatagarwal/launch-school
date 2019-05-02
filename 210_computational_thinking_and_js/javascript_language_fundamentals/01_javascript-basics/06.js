var input = prompt('Please enter a phrase:');
var numberOfCharacters = input.replace(/[^a-zA-z]/g, '').length
// ~~ /g checks for matches globally. stops at first match otherwise.

console.log('There are ' + numberOfCharacters + ' alphabetical characters in "' + input + '".');