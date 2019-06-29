// Use the partial function shown above and your solution to problem 1 to create sayHello and sayHi functions that work like this:

function greet(greeting, name) {
  let capitalizedGreeting = greeting[0].toUpperCase() + greeting.slice(1);
  console.log(capitalizedGreeting + ', ' + name + '!');
}

function partial(primary, arg1) {
  return function(arg2) {
    return primary(arg1, arg2);
  }
}

let sayHello = partial(greet, 'Hello');
let sayHi = partial(greet, 'Hi');

sayHello('Brandon');
// Hello, Brandon!
sayHi('Sarah');
// Hi, Sarah!