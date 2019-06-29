// Write a function named later that takes two arguments: a function and an argument for that function. The return value should be a new function that calls the input function with the provided argument, like this:

function later(func, value) {
  return function() {
    func(value);
  }
}

var logWarning = later(console.log, 'The system is shutting down!');
logWarning(); // The system is shutting down!

// This is a case of partial application. Bind is another case of partial application.