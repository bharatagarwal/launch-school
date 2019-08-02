$(document).ready(function() {
  $('form').submit(function(e) {
    var $form = $(this);
  
    var numerator = parseInt($form.find('#numerator').val(), 10);
    var denominator = parseInt($form.find('#denominator').val(), 10);
    var operator = $form.find('#operator').val();
  
    var result = 0;


    e.preventDefault();

    if (operator === '+') {
      result = numerator + denominator
    } else if (operator === '-') {
      result = numerator - denominator
    } else if (operator === '*') {
      result = numerator * denominator
    } else if (operator === '/') {
      result = numerator / denominator
    }

    $h1 = $('h1');
    $h1.text(result);

  });
})