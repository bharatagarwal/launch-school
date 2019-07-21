// two arguments - a callback, and time duration.

function afterNSeconds(callback, timeDurationInSeconds) {
  setTimeout(callback, timeDurationInSeconds * 1000);
}

afterNSeconds((name) => console.log('bharat'), 1);

afterNSeconds((name) => console.log('agarwal'), 5);