// startCounting logs  anumber to the console every second, starting with 1.
function startCounting() {
  var i = 0;
  setInterval(() => {
    i += 1;
    console.log(i);
  }, 1000);
}

startCounting();