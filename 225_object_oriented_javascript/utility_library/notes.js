

demonstrate the following: 
- organising code into respective objects
- creating and using private data
- IIFEs
- object creation patterns
- using function execution contexts

come up with your own test cases for the assessment
_________________________________________

a utility library that will holds all of its methods on a
parent object. We will be using the `_` character for this
project.
_________________________________________

stage 1
-----

function _(element) {
  return {
    first: function() {
      return element[0];
    },

    last: function() {
      return element[element.length - 1];
    },

    without: function(value) {
      var returnArray = [];
      var args = Array.prototype.slice.call(arguments);

      return element.filter(el => args.includes(el) === false);
    },

    lastIndexOf: function(search) {
      var index = -1;

      for (var i = element.length - 1; i >= 0; i -= 1) {
        if (element[i] === search) return i;
      }

      return index;
    },

    sample: function(quantity) {
      var sampled = [];
      var copy = element.slice();

      var get = function() {
        var index = Math.floor(Math.random() * copy.length);
        var el = copy[index];

        copy.splice(index, 1);
        
        return el;
      };

      if (!quantity) return get();

      while (quantity > 0) {
        sampled.push(newValue);
        quantity -= 1;
      }

      return sampled;
    },
  };
}

_.range = function(start, stop) { // this is a property of the function `_``
  var range = [];

  if (stop === undefined) {
    stop = start;
    start = 0;
  }

  for (var i = start; i < stop; i += 1) {
    range.push(i);
  }

  return range;
};

stage 2
-----

