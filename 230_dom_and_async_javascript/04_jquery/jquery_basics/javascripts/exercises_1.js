var p = console.log;

p($('#content').length); // 0 because body element has not been rendered yet.

$(document).ready(function() {
  p($('#content').length); // 1 because dom has loaded.
  p($('img').width()); // 0 because image hasn't loaded
})

// window.load fire when the assets have loaded 
$(window).load(function() {
  p($('img').width()); // 800 because image has loaded
})

// document.ready v/s window.load

jQuery(fn) === jQuery(document).ready(fn);
jQuery(fn) === $(fn);
jQuery(fn) === $(document).ready(fn);
jQuery === $;
jQuery(function) -> assumes ready
jQuery(node).event(fn);