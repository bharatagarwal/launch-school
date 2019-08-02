// promise.then(successFunction, errorFunction)

let promise = new Promise(function(resolve, reject) {
  setTimeout(function() {
    resolve('done') 
    }, 1000);
});

promise.then(
  function(result) { console.log(result)},
  function(error) { console.log(error)},
);

If we’re interested only in successful completions, then we can provide only one function argument to .then:

let promise = new Promise(resolve => {
  setTimeout(() => resolve("done!"), 1000);
});

promise.then(alert); // shows "done!" after 1 second

If we’re interested only in errors, then we can use null as the first argument: .then(null, errorHandlingFunction). Or we can use .catch(errorHandlingFunction), which is exactly the same:

 





let promise = new Promise((resolve, reject) => {
  setTimeout(() => reject(new Error("Whoops!")), 1000);
});

// .catch(f) is the same as promise.then(null, f)
promise.catch(alert); // shows "Error: Whoops!" after 1 second

// The call .catch(f) is a complete analog of .then(null, f), it’s just a shorthand.

