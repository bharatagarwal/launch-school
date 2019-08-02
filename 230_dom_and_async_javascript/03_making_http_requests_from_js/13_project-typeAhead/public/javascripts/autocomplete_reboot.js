function debounce(func, delay) {
  var timeout;

  return function() {
    var args = arguments;
    console.log(arguments);
    if (timeout) {
      clearTimeout(timeout);
    }

    timeout = setTimeout(function() {
      func(null, args); // partial function application
    }, delay);
  };
}

function Autocomplete(input, url) {
  this.input = input;
  this.url = url;

  // this code is run once in the process of initialising the object.
}

Autocomplete.prototype.bindEvents = function;
Autocomplete.prototype.wrapInput = function() {
Autocomplete.prototype.createUI = function;
Autocomplete.prototype.draw = function;
Autocomplete.prototype.reset = function;
Autocomplete.prototype.valueChanged = function;

bindEvent, wrapInput, createUI, draw, reset, valueChanged.
