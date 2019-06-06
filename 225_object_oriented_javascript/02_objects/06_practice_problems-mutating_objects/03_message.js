var message = 'Hello from the global scope!';

function func() {
  message = 'Hello from the function scope!'; 
  // global scope because no var or let
  // clarification --
  // the global-ity of this scope is not more
  // global than the message variable declared
  // on line 1 -- it's the same scope.
  console.log(message);
}

func();
// 'Hello from the function scope!';

console.log(message);
// 'Hello from the function scope!';