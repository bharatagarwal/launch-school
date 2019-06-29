Factory Functions
-----

factory functions provide us a way to create objects
based on a predefined template

function createPerson(firstName, lastName) {
  var person = {};
  person.firstName = firstName;
  person.lastName = lastName;
  person.fullName = function() {
    return (this.firstName + ' ' + this.lastName);
  };

  return person;
}

---- OR ----

function createPerson(firstName, lastName) {
  return {
    firstName: firstName,
    lastName: lastName,
    fullName: function() { 
      return this.firstName + ' ' + this.lastName
    };
  };
}

however, there are two problems - 
- each object has a copy of the methods, which is the
same code, not unique to an object. thats wasteful.

- hard to keep track of which function created that
object
____________________________________________________

Constructor Pattern
-----

function Person(firstName, lastName) {
  this.firstName = firstName;
  this.lastName = lastName;
  this.fullName = function() {
    return (this.firstName + ' ' + this.lastName);
  };
}

var john = new Person('John', 'Doe');
john.constructor // function Person()
looks for constructor function in the lookup,
finds Person.prototype.constructor
// the constructor property of the prototype
// object is merely present to help keep
// track of which object was used to create
// the object.

john instanceof Person // true

a constructor function has to return an object if you
want to explicitly return something.

primitive or plain return as guard clauses will be
plain ignored.

____________________________________________________

Object and Prototypes
-----

dundo proto points to another object.
When object created with Object.create, dunder-proto
points to the created object.

shallow copy
-- copy the prototype linkage by using 
Object.create(Object.getPrototypeOf(object));
-- make a copy of all the properties in an object
 using Object.getOwnPropertyNames(object)

extend
-- get all the properties of the given objects
-- assign them to the specified destination.

____________________________________________________

Function Prototypes and Object Prototypes
-----

prototype property of the function-object combo,
and __proto__ property of any object.

prototype property is assigned by default an object
that instances of the constructor can delegate to

a function-object combo has a prototype property
as well as a __proto__ property

Prototype pattern of object creation:
- create a constructor function which can take
values unique to an instance
- delegate behavior to the object linked to the
prototype property of the constructor function.

____________________________________________________

Constructors, Prototypes, and the Prototype Chain
-----

function Animal(type) {
  this.type = type;                 
  // values for type are land, air, water
};

Animal.prototype.move = function() {
  console.log('Animal is moving.');
};


function Dog() {};

~~ ENTER CODE HERE [ OPTIONS 1 or 2]~~

Dog.prototype.say = function() {
  console.log(this.name + ' says Woof!');
};

Dog.prototype.run = function() {
  console.log(this.name + ' runs away.');
};

fido = new Dog();
fido.move(); // TypeError: fido.move is not a function

OPTION 1:
Dog.prototype = new Animal('land');
// shares behavior inadvertently
OPTION 2:
Dog.prototype = Object.create(Animal.prototype);
// Dog.prototype object is replaced, and its
// constructor property no longer references
// Dog, instead it references Animal

// We can fix this by adding another line of code
Dog.prototype.constructor = Dog;

ERRONEOUS:
Dog.prototype = Animal.prototype
// This would lead to them pointing to the same object,
// and sharing identical behavior in both directions,
// instead of having a chain relationship

// undefined * undefined = NaN
// undefined + undefined = NaN
____________________________________________________

mutating the constructors prototype rather than
reassigning it
-----

var ninja;
function Ninja() {
  this.swung = true;
}

ninja = new Ninja();

// ninja.__proto__ === Ninja.prototype
// true

Ninja.prototype = {
  swingSword: function() {
    return this.swung;
  },
};

// ninja.__proto__ === Ninja.prototype
// false


// If you reassing the prototype after the object
// has been created, then the __proto__ object
// of will continue pointing to a the original object

// you must mutate the object to add more functionality
// to it rather than reassigning.

console.log(ninja.swingSword());
// Uncaught TypeError: ninja.swingSword is not a function
____________________________________________________

chainable method invocation
-----

var ninjaA;
var ninjaB;
function Ninja() {
  this.swung = false;
}

ninjaA = new Ninja();
ninjaB = new Ninja();

// Add a swing method to the Ninja prototype which
// method must return 'this', or the context
// object
// returns the calling object and modifies swung

console.log(ninjaA.swing().swung);      // must log true
console.log(ninjaB.swing().swung);      // must log true
____________________________________________________

var ninjaA = (function() {
  function Ninja(){};
  return new Ninja();
})();

// create a ninjaB object
// can't do new Ninja or Object.create(Ninja.prototype)
ninjaB = Object.create(Object.getPrototypeOf(ninjaA));
---- or ----
ninjaB = new ninjaA.constructor
// but this would mean that you could inherit the
// properties as well -- not sure that is the intention.
console.log(ninjaB.constructor === ninjaA.constructor);
____________________________________________________

// Create an object called shape that has a 
// getType method.

// function Shape() {
// }

// Shape.prototype.getType = function() {
  // return this.type;
// }

// let shape = new Shape();

// --- or ---

shape = {
  getType: function() {
    return this.type;
  }
}

// Define a Triangle constructor function whose prototype is shape. Objects created with Triangle should have four own properties: a, b, c (representing the sides of a triangle), and type.

function Triangle(side1, side2, side3) {
  // can't do this = Object.create(shape);
  // javascript doesn't allow assigning this directly
  this.type = 'triangle';
  this.firstSide = side1;
  this.secondSide = side2;
  this.thirdSide = side3;
}

// Object.setPrototypeOf(Triangle.prototype, shape);
// Triangle.prototype.__proto__ = shape;
// Triangle.prototype = shape;
// Triangle.prototype.constructor = Triangle;

Triangle.prototype.getPerimeter = function() {
  return this.firstSide + this.secondSide + 
    this.thirdSide;
}

var t = new Triangle(3, 4, 5);
t.constructor;                 // Triangle(a, b, c)
shape.isPrototypeOf(t);        // true
t.getPerimeter();              // 12
t.getType();                   // "triangle"

// create a diagram of what you want and proceed from
// there onwards.
____________________________________________________

function User(first, last) {
  let userObject = {};
  userObject.name = first + ' ' + last;
  return userObject;
  // leverages the fact that a constructor
  // returns an object if a return statement
  // is present
}

var name = 'Jane Doe';
var user1 = new User('John', 'Doe');
var user2 = User('John', 'Doe');

console.log(name);         // => Jane Doe
console.log(user1.name);   // => John Doe
console.log(user2.name);   // => John Doe

scope-sage constructors
---

like Array, Regex, Object

function User(first, last){
  if (!(this instanceof User)) {
    return new User(first, last);
  }

  this.name = first + ' ' + last;
}
____________________________________________________

function createObject(obj) {
  let returnObj = {};
  // Object.setPrototypeOf(returnObj, obj);
  // returnObj.__proto__ = obj;
  return returnObj;
}

var foo = {
  a: 1,
};

var bar = createObject(foo);
foo.isPrototypeOf(bar);

---- or -----

function createObject(obj) {
  function Temp() {
  }

  Temp.prototype = obj;
  return new Temp();
}

____________________________________________________

// create a begetObject method that you can call on any object to create an object inherited from it:

var foo = {
  a: 1,
  // begetObject: function() {
  //   function F() {
  //   }

  //   F.prototype = this;
  //   return new F();
  // }
};

-- question asks for ANY object to be able to access

Object.prototype.begetObject = function() {
  function F() {}
  F.prototype = this;
  return new F();
}

var bar = foo.begetObject();
foo.isPrototypeOf(bar);         // true
____________________________________________________

function neww(constructor, args) {
  let thiss = Object.create(constructor.prototype);
  let result = constructor.apply(thiss, args);
  // assign return value of function
  // if an object is returned, then the constructor
  // function returns the object instead of this
  if (typeof result === 'object' && result !== null) {
    return result
  } else {
    return thiss;
  }
 }

function Person(firstName, lastName) {
  this.firstName = firstName;
  this.lastName = lastName;
}

Person.prototype.greeting = function() {
  console.log('Hello, ' + this.firstName + ' ' + this.lastName);
};

var john = neww(Person, ['John', 'Doe']);
john.greeting();          // => Hello, John Doe
john.constructor;         // Person(firstName, lastName) {...}

____________________________________________________

When a constructor encounters a primitive return value,
it ignores that value. But the fact that theres a 
return statement ensures that the function terminates
at the point of the return statement.

____________________________________________________

function newPerson(name) {
  let obj = {};
  obj.name = name;

  Object.defineProperties(obj, {
    log: {
      value: function() {
        console.log(this.name)
      },
      writeable: false,
    }
  });

  return obj;
  // return Object.defineProperties({ name: name }, {
  // log: { value: function()cl-name, writeable-false}
  // }});
}


var me = newPerson('Shane Riley');
me.log();     // => Shane Riley
me.log = function() { console.log('Amanda Rose'); };
me.log();

defineProperties lets us decide whether a property is
writeable or not
____________________________________________________

Object.freeze
-----

If I want to prevent any properties of an object to be
immutable, I can use Object.freeze. This prevents any
property values that are not objects from being
changed or deleted. ie. primitives and functions becomes 
immutable.

properties of a frozen object can be mutated but not 
reassigned.

This locks in primitives and functions.

