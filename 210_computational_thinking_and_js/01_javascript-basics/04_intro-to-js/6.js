// Use map and filter to first determine the lengths of all the elements in an array of string values, then discard the even values (keep the odd values).

let arr = ['a', 'abcd', 'abcde', 'abc', 'ab'];

function oddLengths(array) {
  filtered_array = array.filter((val) => {
    return (val.length % 2 === 1)
  });

  return filtered_array.map((element) => element.length)
}

console.log(oddLengths(arr)); // => [1, 5, 3]