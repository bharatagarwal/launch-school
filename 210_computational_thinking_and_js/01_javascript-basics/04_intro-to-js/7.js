copyObj = (objToCopy, keys = Object.keys(objToCopy)) => {
  let newObject = {}
  
  keys.forEach( (key) => {
   newObject[key] = objToCopy[key] 
  });

  return newObject;
}

let objToCopy = {
  foo: 1,
  bar: 2,
};

let newObj = copyObj(objToCopy);
console.log(newObj.foo);    // => 1
console.log(newObj.bar);    // => 2

let newObj2 = copyObj(objToCopy, [ 'foo' ]);
console.log(newObj2.foo);   // => 1
console.log(newObj2.bar);   // => undefined