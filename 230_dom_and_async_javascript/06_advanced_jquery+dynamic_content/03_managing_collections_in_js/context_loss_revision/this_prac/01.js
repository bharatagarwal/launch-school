// What does this point to in the code below?

function foo() {
  function bar() {
    function baz() {
      console.log(this);
    }

    baz();
  }

  bar();
}

foo();  // window