function loadScript(src, callback) {
  let script = document.createElement('script');
  script.src = src;

  script.onload = function() {
    callback(null, script);
  };

  script.onerror = function() {
    callback(new Error(`Script load error for ${src}`));
  }

  document.head.append(script);
}

loadScript('/my/script.js', function(error, script) {
  if (error) {
    // handle error
  } else {
    // script loaded successfully.
  }
});

This is called the 'error-first callback pattern'
The first argument is reserved for an error if it occurs.
The next arguments are for the successful results.