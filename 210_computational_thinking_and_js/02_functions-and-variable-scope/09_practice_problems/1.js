function say() {
  // var a -> hoisting will take place.

  if (false) {
    var a = 'hello from inside a block'; // scoping is function level,
                                         // not block level
  }

  console.log(a);
}

say();