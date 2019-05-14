// the reduce passes four arguments to the callback on each call:

// accumulator, currentValue, currentIndex, array

function myReduce(array, func, initialValue) {
  let accumulator;
  let index;
  if (initialValue === undefined) {
    accumulator = array[0];
    index = 1;
  } else {
    accumulator = initialValue;
    index = 0;
  }

  // for (; index < array.length; index += 1) {
  //   accumulator = func(accumulator, array[index], index, array);
  // }

  array.slice(index).forEach(function (element) {
    accumulator = func(accumulator, element);
  })

  return accumulator;
}

var smallest = function (result, value) {
  return result <= value ? result : value;
};

var sum = function (result, value) {
  return result + value;
};

console.log(myReduce([5, 12, 15, 1, 6], smallest));           // 1
console.log(myReduce([5, 12, 15, 1, 6], sum, 10));            // 49