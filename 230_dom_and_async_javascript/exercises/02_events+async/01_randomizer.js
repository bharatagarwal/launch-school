// Write a randomizer function that accepts n callbacks and calls each callback at some random point in time between now and 2 * n seconds from now. For instance, if the caller provides 5 callbacks, the function should run them all sometime within 10 seconds.

// While running, randomizer should log the elapsed time every second: 1, 2, 3, ..., 2 * n.

// Expect the output to change with each run due to the random execution times.

function randomizer() {
  var callbacks = Array.from(arguments);
  var time = 0;

  var intervalId = setInterval(function() {
                    time += 1;
                    console.log(time);

                    if (time >= 2 * callbacks.length) {
                      clearInterval(intervalId);
                    }
                  }, 1000);


  callbacks.forEach((callback, index) => {
    var timeInSeconds = Math.floor(Math.random() * 2 * callbacks.length) + 1;
    console.log(`time for callback${index + 1}: ${timeInSeconds}`);
    setTimeout(callback, timeInSeconds * 1000);
  });
}

function callback1() {
  console.log('callback1');
}

function callback2() {
  console.log('callback2');
}

function callback3() {
  console.log('callback3');
}

function callback4() {
  console.log('callback4');
}

function callback5() {
  console.log('callback5');
}

randomizer(callback1, callback2, callback3, callback4, callback5);

// Output:
// 1
// 2
// "callback2"
// 3
// "callback3"
// 4
// 5
// "callback1"
// 6