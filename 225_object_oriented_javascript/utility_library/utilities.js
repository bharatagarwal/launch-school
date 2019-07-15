// notes: 
// _ object is a function that returns an object with methods when an element is passed in.
// it's also got some methods of its own, as properties of the function object,
// that can be used when there are no receiver objects

(function() {

  var findObjs = function(element, checkingObject, multiple) {
    var match = multiple ? [] : undefined;

    element.some(obj => {
      var allMatch = true;

      for (var prop in checkingObject) {
        if ((!prop in obj) || obj[prop] !== checkingObject[prop]) {
          allMatch = false;
        }
      }

      if (allMatch) {
        if (multiple) {
          match.push(obj);
        } else {
          match = obj;
          return true;
        }
      }
    });

    return match;
  };

  var _ = function(element) {
    var u = {
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
          if (element[i] === search) {
            return i;
          }
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

        if (!quantity) {
          return get();
        }

        var newValue;

        while (quantity > 0) {
          newValue = get();
          if (sampled.includes(newValue) === false) {
            sampled.push(newValue);
          }
          
          quantity -= 1;
        }

        return sampled;
      },

      findWhere: function(checkingObject) {
        return findObjs(element, checkingObject, false);
      },

      where: function(checkingObject) {
        return findObjs(element, checkingObject, true);
      },

      pluck: function(query) {
        return element.filter(el => {
          return el.hasOwnProperty(query);
        }).map(el => {
          return el[query];
        });
      },

      keys: function() {
        return Object.keys(element);
      },

      values: function(){
        return Object.values(element);
      },
      pick: function(properties) {
        let returnObject = {};
        Object.keys(element).filter(prop => properties.includes(prop)).forEach(prop => returnObject[prop] = element[prop]);
        return returnObject;
      },
      omit: function(properties) {
        let returnObject = {};
        Object.keys(element).filter(prop => !properties.includes(prop)).forEach(prop => returnObject[prop] = element[prop]);
        return returnObject;
      },
      has: function(prop) {
        return {}.hasOwnProperty.call(element, prop);
      },
      isElement: function() {
        return element && element.nodeType === 1;
        // just return .nodeType would return error if object is not defined.
      },
      isArray: function() {
        return Array.isArray(element);
      },
      isObject: function() {
        return ['function', 'object'].includes(typeof element) && !!element;
      },
      isFunction: function() {
        return (typeof element === 'function');
      },
      isBoolean: function() {
        return (toString.call(element) === '[object Boolean]');
      },
      isString: function() {
        return (toString.call(element) === '[object String]');
      },
      isNumber: function() {
        return (toString.call(element) === '[object Number]');
      },
    };
    return u;
  };

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

  _.extend = function() {
    var args = [].slice.call(arguments);
    var old_obj = args.pop();
    var new_obj = args[args.length - 1];

    for (var prop in old_obj) {
      new_obj[prop] = old_obj[prop];
    }

    return args.length === 1 ? new_obj : _.extend.apply(_, args);
  };

  _.isElement = argument => _(argument).isElement();
  _.isArray = argument => _(argument).isArray();
  _.isObject = argument => _(argument).isObject();
  _.isFunction = argument => _(argument).isFunction();
  _.isBoolean = argument => _(argument).isBoolean();
  _.isString = argument => _(argument).isString();
  _.isNumber = argument => _(argument).isNumber();

  window._ = _;
})();