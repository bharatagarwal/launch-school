function slice(array, begin, end) {
  // does not mutate
  // begin...end

  let returnArray = []

  if (begin > array.length) {
    begin = array.length;
  } else if (end > array.length) {
    end = array.length;
  }

  for (let i = begin; i < end; i += 1) {
    returnArray.push(array[i]);
  }

  return returnArray;
}

console.log(slice([1, 2, 3], 1, 2));               // [2]
console.log(slice([1, 2, 3], 2, 0));               // []
console.log(slice([1, 2, 3], 5, 1));               // []
console.log(slice([1, 2, 3], 0, 5));               // [1, 2, 3]

var arr = [1, 2, 3];
console.log(slice(arr, 1, 3));                     // [2, 3]
console.log(arr);                                  // [1, 2, 3]
console.log();

function splice(array, startIndex, deleteCount) {
  let returnArray = [];

  if (startIndex > array.length) {
    startIndex = array.length;
  }

  if (deleteCount > array.length - startIndex) {
    deleteCount = array.length - startIndex;
  }

  for (let i = startIndex; i < startIndex + deleteCount; i+= 1) {
    returnArray.push(array[i]);
    array[i] = array[i + 1];
  }

  array.length -= deleteCount;

  if (arguments.length > 3) {
    // insert each argument into array

    for (let j = arguments.length - 1; j >= 3; j -= 1) {
      // insert arguments[j] into array at startIndex
      for (let k = array.length - 1; k >= startIndex; k -= 1) {
        array[k + 1] = array[k]
      }

      array[startIndex] = arguments[j]
    }
  }

  return returnArray
}
  // returns new array containing deleted elements
  // if optional arguments are provided, those are inserted at the beginning
  // of slice

  // If the value of start is greater than the length of the array, set it to equal the length.

  // If the value of deleteCount is greater than the number of elements from start up to the end of the array, set deleteCount to the difference between the array's length and start.

console.log(splice([1, 2, 3], 1, 2));              // [2, 3]
console.log(splice([1, 2, 3], 1, 3));              // [2, 3]
console.log(splice([1, 2, 3], 1, 0));              // []
console.log(splice([1, 2, 3], 0, 1));              // [1]
console.log(splice([1, 2, 3], 1, 0, 'a'));         // []

var arr = [1, 2, 3];
console.log(splice(arr, 1, 1, 'two'));             // [2]
console.log(arr);                                  // [1, "two", 3]

var arr = [1, 2, 3];
console.log(splice(arr, 1, 2, 'two', 'three'));    // [2, 3]
console.log(arr);                                  // [1, "two", "three"]

var arr = [1, 2, 3];
console.log(splice(arr, 1, 0));                    // []
console.log(splice(arr, 1, 0, 'a'));               // []
console.log(arr);                                  // [1, "a", 2, 3]

var arr = [1, 2, 3];
console.log(splice(arr, 0, 0, 'a'));               // []
console.log(arr);   