let status = '';

function startup() {
  var status = 'ready';
  return function() {
    console.log('The system is ready.');
  };
}

function giveMeStatus() {
  return status;
}

var ready = startup();
// var systemStatus = ;
// console.log(giveMeStatus.call(ready));

// How can you set the value of systemStatus to the value of the inner variable status without changing startup in any way?

// It's not possible!