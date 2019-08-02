new Promise(function(resolve, reject) {
  setTimeout(() => resolve(1), 1000);
}).then(function(result) {
  console.log(result);
  return result * 2;
}).then(function(result){
  console.log(result);
  return result * 2;
}).then(function(result) {
  console.log(result);
  return result * 2;
});

// returns the promise object
// chained promise returns the promise object.

// a call to promise.then returns a promise, so that we can call the next .then on it.

// when the promise returns a value, that promise is said to be resolved.