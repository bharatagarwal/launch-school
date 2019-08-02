Find the list item that contains the text ac ante, then locate the parent li element.

$('li').filter(function(index, element) { return $(this).text() === 'ac ante' }).parents('li')

$('li li').filter(":contains('ac ante')").parents('li');
// or
$("li li:contains('ac ante')").parents('li');