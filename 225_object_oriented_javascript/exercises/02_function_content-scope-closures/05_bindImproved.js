// Our earlier implementation of the Function.prototype.bind was simplistic. Function.prototype.bind has another trick up its sleeve besides hard-binding functions to context objects. It's called partial function application. Read this assignment and the MDN documentation to learn more about partial function application.

// Alter the myBind function written in the previous exercise to support partial function application.

function myBind(func, context) {
  let prependArguments = [].slice.call(arguments, 2);

  return function() {
    let givenArguments = [].slice.apply(arguments);
    let fullArguments = prependArguments.concat(givenArguments);
    // return func.call(context, ...args, ...arguments);
    return func.apply(context, fullArguments);
  };
}

function addNumbers(a, b) {
  return a + b;
}

var addFive = myBind(addNumbers, null, 5);

console.log(addFive(10)) // 15