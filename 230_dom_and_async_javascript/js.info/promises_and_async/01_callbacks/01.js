function loadScript(src, callback) {
  let script = document.createElement('script');
  script.src = src;

  script.onload = function() {
    callback(script) 
  };
  
  document.head.append(script);
}

loadScript(/my/script.js, function() {
  newFunction(); // newFunction a part of script.js
})