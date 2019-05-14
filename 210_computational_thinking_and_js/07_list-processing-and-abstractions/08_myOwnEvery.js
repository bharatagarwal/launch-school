function myOwnEvery(array, func) {
  let i;

  for (i = 0; i < array.length; i += 1) {
    if (!func(array[i], i, array)) return false;
  }

  return true;
}

var isAString = function (value) {
  return typeof value === 'string';
};

console.log(myOwnEvery(['a', 'a234', '1abc'], isAString));       // true

// forEach and all array abstractions except every and some run through all elements of the array -- there's no way to short-circuit them.