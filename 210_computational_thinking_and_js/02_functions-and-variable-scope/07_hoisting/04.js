// ~~ function declaration is hoisted first
// -- located above variable declaration.

bar();
var foo = 'hello';

function bar() {
  console.log('foo');
}