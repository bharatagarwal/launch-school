let promise = new Promise(function(resolve, reject) {
  // the executor should do a job (something that takes time usually) and then call resolve or reject to change the state of the corresponding Promise object.

  setTimeout(function() {
    resolve('done'); // will set result to 'done' and status to fulfilled.
  }, 1000);
}

// resolve and reject are predefined by javascript

// there should only be one call for resolve and reject
// if there are any further, they will be ignored.