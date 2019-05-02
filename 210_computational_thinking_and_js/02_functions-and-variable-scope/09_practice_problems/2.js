function hello() {
  a = 'hello';
  console.log(a); -> // hello

  if (false) {
    var a = 'hello again'; // declaration causes 'a' to become
                           // a local variable rather than global
  }
}

hello();
console.log(a); // -> a is not defined.