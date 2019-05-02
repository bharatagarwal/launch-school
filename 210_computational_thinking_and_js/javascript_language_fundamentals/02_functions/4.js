var myVar = 'This is global';

function someFunction() {
  console.log(myVar); // global
}

someFunction();