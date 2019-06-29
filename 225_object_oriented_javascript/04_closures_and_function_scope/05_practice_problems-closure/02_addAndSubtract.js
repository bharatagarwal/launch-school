let runningTotal = 0;

function add(number) {
  runningTotal += number;
  console.log(runningTotal);
}

function subtract(number) {
  runningTotal -= number;
  console.log(runningTotal);
}

add(1);
// 1
add(42);
// 43
subtract(39);
// 4
add(6);
// 10