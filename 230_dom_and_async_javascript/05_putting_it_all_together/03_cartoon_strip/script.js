$(function() {
  var $blinds = $('[id^=blind]');
  
  function startAnimation() {
    $blinds.each(function(i) {
      // $blinds[i] will give a DOM element
      // rather than a jquery object

      var $blind = $blinds.eq(i);

      $blind.delay(500 * i + 250).animate({
        top: "+=" + $blind.height,
        height: 0,
      }, 250);
    });
  }

  startAnimation();

  $('a').click(function(e) {
    e.preventDefault();
    $blinds.finish();
    $blinds.removeAttr('style');
    startAnimation();
  });
});

