var greeter = {
  morning: function() {
    console.log('Good morning!');
  },
};

function evening() {
  console.log('Good evening!');
}

greeter             // object
greeter.morning     // function
greeter.morning()   // method invocation
evening()           // function invocation

var functionGreeter = greeter.morning;
greeter.morning()   // method invocation
functionGreeter();  // function invocation

