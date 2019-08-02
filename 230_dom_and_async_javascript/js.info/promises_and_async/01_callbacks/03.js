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

loadScript('1.js', function(error, script) {
  if (error) {
    handleError(error);
  } else {
    // next bit of logic is dependent on 2.js loading
    loadScript('2.js', function(error, script){
      if (error) {
        handleError(error);
      } else {
        // next bit of logic is dependent on 3.js loadings
        // ... and so on.
      }
    })
  }
});