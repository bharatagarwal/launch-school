// delayLog loops through 1 to 10, and logs each number after that seconds.

function logI(value) {
  return function() {
    console.log(value);
  }
}

function delayLog() {
  for (var i = 1; i <= 10; i += 1) {
    setTimeout(logI(i), i * 1000);
  }
}

delayLog();

// by creating a helper function, every function call for the setTimer is a new function, and all the given functions will have their own closure, and therefore will log values as expected.