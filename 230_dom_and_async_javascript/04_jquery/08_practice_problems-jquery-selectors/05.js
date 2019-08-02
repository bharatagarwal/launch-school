Find the table element, then find all the odd-numbered table rows in that element.

$('table').find('tr').filter(':odd');
// or
$('table').find('tr:odd');