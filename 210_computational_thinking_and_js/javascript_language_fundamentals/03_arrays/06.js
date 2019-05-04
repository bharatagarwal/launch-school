function reverse(inputForReversal) {
  let newElement;
  let length = inputForReversal.length;
  let i;
  
  if (typeof(inputForReversal) === 'string') {
    newElement = '';

    for (i = 0; i < length; i += 1) {
      newElement += inputForReversal[length - 1 - i];
    }
  } else if (Array.isArray(inputForReversal)) {
    newElement = [];

    for (i = 0; i < length; i += 1) {
      newElement[i] = inputForReversal[length - 1 - i];
    }
  }

  return newElement;  
}

console.log(reverse('Hello'));           // "olleH"
console.log(reverse('a'));               // "a"
console.log(reverse([1, 2, 3, 4]));      // [4, 3, 2, 1]
console.log(reverse([]));                // []

var array = [1, 2, 3];
console.log(reverse(array));             // [3, 2, 1]
console.log(array);                      // [1, 2, 3]