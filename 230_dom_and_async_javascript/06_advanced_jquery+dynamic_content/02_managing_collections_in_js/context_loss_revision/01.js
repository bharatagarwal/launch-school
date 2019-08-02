// situations with context loss

// sitch 1: method losing context when taken out of an object.

var john = {
  firstName: 'John',
  lastName: 'Doe',
  greetings: function() {
    console.log('hello, ' + this.firstName + ' ' + this.lastName);
  },
};

var foo = john.greetings;
// foo = function() {
//    console.log('hello, ' + this.firstName + ' ' + this.lastName);
//  },
foo(); // logs `hello undefined undefined'`
foo.call(john); // logs `hello John Doe`;