// Write a function that returns the object on a given object's prototype chain where a property is defined. See the example code below:

function getDefiningObject(object, propKey) {
  let currentObject = object;
  while (currentObject !== null && !currentObject.hasOwnProperty(propKey)) {
    currentObject = Object.getPrototypeOf(currentObject);
  }

  return currentObject;
}

var foo = {
  a: 1,
  b: 2,
};

var bar = Object.create(foo);
var baz = Object.create(bar);
var qux = Object.create(baz);

bar.c = 3;

console.log(getDefiningObject(qux, 'c') === bar);     // => true
console.log(getDefiningObject(qux, 'e'));             // => null