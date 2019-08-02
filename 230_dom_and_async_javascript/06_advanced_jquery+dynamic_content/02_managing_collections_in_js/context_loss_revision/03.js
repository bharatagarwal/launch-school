// internal function losing method context

var obj = {
  a: 'hello',
  b: 'world',
  foo: function() {
    function bar() {
      console.log(this.a + ' ' + this.b);
    }

    bar();
  },
};

obj.foo();

soln 1: preserve context with a local variable in lexical scope
  var self = this;
  function bar() {
    console.log(self.a + ' ' + self.b);
  }

soln 2: pass the context to internal functions
  bar.call(this);

soln 3: bind the context with a function expression
  foo: function() {
    var bar = function() {
      console.log(this.a + ' ' + this.b);
    }.bind(this);

    bar();

    bar();

    bar();
  }

//  using bind means that you've only got to do it once.