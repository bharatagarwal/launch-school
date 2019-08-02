$(function() {
  var $slideshow = $('#slideshow');
  var $nav = $slideshow.find('ul');
  
  // .on( events [, selector ] [, data ], handler )
  // selector
  // Type: String
    // A selector string to filter the descendants of the selected elements that trigger the event. If the selector is null or omitted, the event is always triggered when it reaches the selected element.

  $nav.on('click', 'a', function(e) {
    e.preventDefault();
    // console.log(e.currentTarget); // refers to the anchor
    // console.log(e.target); refers to the image
    var $li = $(e.currentTarget).closest('li');
    // searches outwards to get to the list.
    var idx = $li.index(); 

    $slideshow.find('figure').filter(':visible').hide();
    $slideshow.find('figure').eq(idx).delay(300).show();

    $nav.find('.active').removeClass('active');
    $li.addClass('active');
  }) 
});