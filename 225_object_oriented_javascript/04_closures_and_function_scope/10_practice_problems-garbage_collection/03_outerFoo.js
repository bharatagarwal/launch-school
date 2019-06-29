var outerFoo;

function bar() {
  var innerFoo = 0;
  outerFoo = innerFoo;
}

bar();

// can outerFoo's 0 be garbage collected here?: but it can be used later in the program.

// more code

// In the code above, is the value referenced by outerFoo eligible for garbage collection on line 10?

