// OLOO which stands for "Object Linking to Other Objects," is first popularized by Kyle Simpson. JavaScript sheds its pretense as a "class oriented" language, where it uses constructor functions as fake classes. Instead, it embraces its prototype based object model. With the OLOO pattern, we define the shared behaviors on a prototype object, then use Object.create() to create objects that inherit directly from that object, without going through the roundabout way that involves "constructors and their prototype properties."

var Point = {                       // capitalized name for the prototype as a convention
  x: 0,                             // default value defined on the prototype
  y: 0,

  onXAxis: function() {             // shared methods defined on the prototype
    return this.y === 0;
  },

  onYAxis: function() {
    return this.x === 0;
  },

  distanceToOrigin: function() {
    return Math.sqrt((this.x * this.x) + (this.y * this.y));
  },

  init: function(x, y) {            // optional init method to set states
    this.x = x;                     // init is a setter, similar to initialize
    this.y = y;                     // init written at the end
    return this;                    // returns object to enable chainability
  },
};

var pointA = Object.create(Point).init(30, 40);
var pointB = Object.create(Point);

Point.isPrototypeOf(pointA);        // use isPrototypeOf to check type
Point.isPrototypeOf(pointB);

pointA.distanceToOrigin();          // 50
pointB.onXAxis();                   // true