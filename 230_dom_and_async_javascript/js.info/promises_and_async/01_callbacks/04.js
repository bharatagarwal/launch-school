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

loadScript('1.js', step1);

function step1(error, script) {
  if (error) {
    handleError(error);
  } else {
    loadScript('2.js', step2);
  }
}

function step2(error, script) {
  if (error) {
    handleError(error);
  } else {
    // ... continue after all the scripts have loaded.
  }
}

// these step* functions are leading to namespace cluttering.