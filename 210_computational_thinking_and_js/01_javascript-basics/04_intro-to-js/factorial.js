function times(number1, number2) {
  let result = number1 * number2;
  console.log(result);
  return result;
}

// Use the times function shown below to write a program that logs 
// the value of 1! (one factorial), 2! (two factorial), 3!, 4!, 
// and 5! (five factorial) to the console.

times(5, times(4, times(3, times(2, times(1, 1)))));