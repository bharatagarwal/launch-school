var foo = {
  a: 0,
  incrementA: function() {
    function increment() {
      this.a += 1;
    }.bind(this) // won't work

    increment();
    increment();
    increment();
  }
};

instead, it has to be increment = function(){}.bind(this);
// bind doesn't work with declaration, it has to be an expression.