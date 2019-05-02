var myVar = 'This is global';

function someFunction() {
  var myVar = 'This is local';
  console.log(myVar); // This is local
}

someFunction();