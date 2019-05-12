var myObject = {
  a: 'name',
  'b': 'test',
  123: 'c',
  1: 'd',
};

myObject[1]; // 'd'
myObject[a]; // ReferenceError
myObject.a; // 'name'