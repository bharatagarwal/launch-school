var message = 'Hello from the global scope!';

function func(message) {
  message = 'Hello from the function scope!';
  console.log(message);
}

func(message);
// Hello from the function scope!

console.log(message);
// Hello from the global scope!