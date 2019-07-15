// Write a JavaScript function named delayLog that loops through the numbers from 1 to 10, and logs each number after that number of seconds. It should log 1 after 1 second, 2 after 2 seconds, etc.

function makeLogger(number) {
  return function() {
    console.log(number);
  }
}

function delayLog() {
  var i;
  for (i = 1; i <= 10; i += 1) {
    var logger = makeLogger(i);
    setTimeout(logger, i * 1000);
  }
}

delayLog();
// 1  // 1 second later
// 2  // 2 seconds later
// 3  // 3 seconds later
// 4  // etc...
// 5
// 6
// 7
// 8
// 9
// 10