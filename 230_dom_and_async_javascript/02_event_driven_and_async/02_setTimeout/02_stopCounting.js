// startCounting logs  anumber to the console every second, starting with 1.
var counterId;

function startCounting() {
  var i = 0;
  counterId = setInterval(() => {
    i += 1;
    console.log(i);
  }, 1000);
}

function stopCounting(id) {
  clearInterval(id);
}

startCounting();
setTimeout(stopCounting, 3000, counterId);