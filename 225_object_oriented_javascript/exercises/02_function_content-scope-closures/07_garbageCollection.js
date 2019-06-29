function makeCounter() {
  var count = 1; // set afresh for each instance called upon

  return function() {
    console.log(count++); // logs value and increments by 1
    console.log(count);
  };
}

var counter = makeCounter();
counter(); // logs 1, increases value by 1

// Read the code carefully. Will the JavaScript garbage collection mechanism garbage collect the variable count after the function counter is run on line 10?

var counter2 = makeCounter();
counter2(); 