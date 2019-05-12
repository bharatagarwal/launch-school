var myArray = [5, 5];
myArray[-1] = 5;
myArray[-2] = 5;

function average(array) {
  var sum = 0;
  var i;

  for (i = -2; i < array.length; i += 1) {
    sum += array[i];
  }

  let length = Object.keys(array).length
  return sum / length;
}

console.log(average(myArray)); // 10 because length is 2, not 4.