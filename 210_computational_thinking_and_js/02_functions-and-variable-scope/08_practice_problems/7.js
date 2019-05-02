console.log(a); // -> Reference error as hello() is not invoked anywhere.

function hello() {
  a = 1;
}