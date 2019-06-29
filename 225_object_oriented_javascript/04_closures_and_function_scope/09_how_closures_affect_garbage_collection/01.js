var a = 34;

function add(b) {
  a += b;
}

function run() {
  var c = add(4);
}

run();

// when can a, b and c be garbage collected
// a -> can't
// b -> can be collected at add invocation on line 8
// c -> can be collected at the end of function declaration of add