function debounce(func, delay) {
  var timeout;

  return function() {
    var args = arguments;
    if (timeout) {
      clearTimeout(timeout);
    }
    timeout = setTimeout(function() {
      func.apply(null, args);
    }, delay);
  };
}

this.valueChanged = debounce(this.valueChanged.bind(this), 300);

this.input.addEventListener('input', this.valueChanged); // already bound

valueChanged: function() {
  var value = this.input.value;
  this.previousValue = value;

  if (value.length > 0) {
    this.fetchMatches(value, function(matches) {
      this.visible = true;
      this.matches = matches;
      this.bestMatchIndex = 0;
      this.selectedIndex = null;

      this.draw();
    }.bind(this));
  } else {
    this.reset();
  }
}

-----

valueChanged -> function(), returns undefined.
debounce(this.valueChanged.bind(this), 300) -> returns a function with closure
        (bound function, integer);
debounce(func, delay) -> returns a function with timer in closure.
when the returned function is invoked, its arguments are applied with null as execution context.

so, when I say this.previousValue = value, it should be windows.previousValue, and window.reset.