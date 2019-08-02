let promise = new Promise(function(resolve, reject) {
  // executor; contains producing code that leads to a result
});

promise.state // initially pending, and then fulfilled or rejected
promise.result // an arbitrary value, initially undefined.

typeof resolve // function
typeof reject // function

// relevant function invoked after executor has finished its job
resolve(value) // to indicate job has finished successfully
// sets state to fulfilled, and result to value
reject(error) // to indicate that an error has occurred
// sets state to rejected
// sets result to error


