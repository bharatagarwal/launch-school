Find the list item that contains the text ac ante, then find and return the next element.

$(`li li:contains('ac ante') ~ *`).first()
$(`li li:contains('ac ante')`).next()