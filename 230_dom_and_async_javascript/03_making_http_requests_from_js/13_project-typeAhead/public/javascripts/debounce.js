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