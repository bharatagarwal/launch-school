Find all the table cells that do not have a class of "protected".

$("table td[class!='protected']")

$("table td").not('.protected')

$('td:not(".protected")');