// Write a function named greet that takes two arguments and logs a greeting:

function greet(greeting, name) {
  let capitalizedGreeting = greeting[0].toUpperCase() + greeting.slice(1);
  console.log(capitalizedGreeting + ', ' + name + '!');
}

greet('howdy', 'Joe');
// Howdy, Joe!
greet('good morning', 'Sue');
// Good morning, Sue!