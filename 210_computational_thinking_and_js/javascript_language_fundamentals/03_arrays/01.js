var myArray = [1, 2, 3, 4];
var myOtherArray = myArray;

myArray.pop();
console.log(myOtherArray); // [1, 2, 3]

myArray = [1, 2];
console.log(myOtherArray); // [1, 2, 3]