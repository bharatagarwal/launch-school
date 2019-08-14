// Locate the template by ID and compile it to a template function. Render the post to the body element using the function.

var templateNode = document.querySelector('#post');
var textCreator = Handlebars.compile(templateNode.textContent);

$(document.body).append(textCreator());