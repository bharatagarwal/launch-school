function someFunction() {
  myVar = 'This is global'; // without initializing, therefore global
}

someFunction();
console.log(myVar); // ~~ReferenceError~~ 