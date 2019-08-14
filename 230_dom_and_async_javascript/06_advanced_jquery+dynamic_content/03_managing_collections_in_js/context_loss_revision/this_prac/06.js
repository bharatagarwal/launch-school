var a = 1;
function bar() {
  console.log(this.a);
}

var obj = {
  a: 2,
  foo: bar,
};

obj.foo(); // ~~ 1 ~~

equivalent to

obj { a: 2, foo: fn(){ console.log(this.a) }}