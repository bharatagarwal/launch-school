// A finally handler has no arguments. In finally we don’t know whether the promise is successful or not. That’s all right, as our task is usually to perform “general” finalizing procedures.

// A finally handler passes through results and errors to the next handler.

// For instance, here the result is passed through finally to then:

 new Promise((resolve, reject) => {
    setTimeout(() => resolve("result"), 2000)
  })
  .finally(() => alert("Promise ready"))
  .then(result => alert(result)); // <-- .then handles the result