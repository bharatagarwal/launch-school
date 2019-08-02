// sitch: function as argument losing surrounding context

function repeatThreeTimes(func) {
  func();
  func();
  func();
}

var john = {
  firstName: 'John',
  lastName: 'Doe',
  greetings: function() {
    repeatThreeTimes(function() {
      console.log(`hello, ${this.firstName} ${this.lastName}`);
    });
  },
}

john.greetings();

// hello, undefined undefined
// hello, undefined undefined
// hello, undefined undefined

soln 1: use a local variable in the lexical scope to store `this`

var obj = {
  a: 'hello',
  b: 'world',
  foo: function() {
    var self = this;
    [1, 2, 3].forEach(function(number) {
      console.log(`${number} ${self.a} ${self.b}`); 
    }) ;
  },
};

// local variables in a callback are lexically scoped
// execution context is not lexically scoped -> it's either a matter of
// explicitly specifying it, or using `this` lexically with a arrow function.

// exercise: see how you can handle callbacks with arrow functions.

soln 2: binding argument function with surrounding context

var obj = {
  a: 'hello',
  b: 'world',
  foo: function() {
    [1, 2, 3].forEach(function(number) {
      console.log(); // something involving this
    }.bind(this));
  },
};

obj.foo();

// soln 3: use forEachs optional `this` argument