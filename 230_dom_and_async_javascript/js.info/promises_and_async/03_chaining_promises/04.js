function loadScript(src) {
  return new Promise(function(resolve, reject) {
    var script = document.createElement('script');
    script.src = src;
    script.onload = () => resolve(script);
    script.onerror = () => resolve(new Error(`Script load error for ${src}`));
    
    document.head.append(script);
  });
}

loadScript('article/promise-chaining/one.js')
  .then(function(script) {
    return loadScript('article/promise-chaining/two.js');
  })
  .then(function(script)) {
    return loadScript('article/promise-chaining/three.js');
  }
  .then(function(script)) {
    // use functions declared in scripts
    // to show that they indeed load onto the head
    // and therefore the logic inside them is accessible by this point.
    one();
    two();
    three();
  });