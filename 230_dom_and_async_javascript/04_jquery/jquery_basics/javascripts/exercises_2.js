var p = console.log;

var $content = $('#content');
p($content.jquery); // '1.11.3'
// lowercase, jQuery property will return undefined.

if ($content.jquery) console.log('jQuery collection!')
p($content.context);
// since not wrapped around ready, it's not collecting
// main element 

// $content.width = 500; assumes inner width to be 500
// if box-sizing is border-box, it sets width to 500+padding
// because it assumes you're giving the internal width of the
// element.
// sets the value according to whatever is the value of the
// box-sizing property at the time of settr call.

// added as an inline style, may interfere with box model.
// width returned by gettr is always going to be in pixel (in 1.11.3 at least) 
