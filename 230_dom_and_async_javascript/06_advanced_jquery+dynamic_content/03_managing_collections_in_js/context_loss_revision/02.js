// in a callback, if we don't explicitly provide context,
// the function will be called with global context
// and that might mean some context is lost.

function repeatThreeTimes(func) {
  func();
  func();
  func();
}

// func is a callback;

function foo() {
  var john = {
    fN: 'John',
    ln: 'Doe',
    greetings: function() {
      console.log(`Hello ${this.fN} ${this.lN}`);
    },
  };

  repeatThreeTimes(john.greetings);
  // the function is passed in, but the context is lost along the way.
}

soln: fn repeatThreeTimes(callback, context) {
  func.call(context);
  func.call(context);
  func.call(context);
}

fn foo() {
  // ...
  repeatThreeTimes(john.greetings, john)
}

foo();