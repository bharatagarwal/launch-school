// set default password
// ask user for password, keep count of the number of attempts failed.
// function returns message to go to the console.

let password = 'password';

function askForPassword() {
  let incorrectCount = 0;
  let enteredPassword = '';

  while (incorrectCount < 3) {
    enteredPassword = prompt("What is the password?");
    if (enteredPassword !== password){
      incorrectCount += 1
    } else {
      console.log('You have successfully logged in.');
      return;
    }
  }

  console.log('You have been denied.');
}