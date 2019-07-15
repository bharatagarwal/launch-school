Write a JavaScript function that takes an element's id and returns the DOM tree of the element in a two-dimensional array. The first subarray contains the element and its siblings, the second contains the parent of the element and its siblings, so on and so forth, all the way up to the "grandest" parent. Assume that the grandest parent is the element with an id of "1". Use the following HTML and test cases to test your code:

grandest parent is 'document'

return dom tree in the form of a two dimensional array
[element + siblings, parents + siblings, .... html]

document.childNodes -> html, html. ignore the first one because its doctype html.

document.childNodes[1].childNodes -> head, text, body
document.childNodes[1].childNodes[0].childNodes -> text, title, text
document.childNodes[1].childNodes[0].childNodes[1].childNodes -> text
document.childNodes[1].childNodes[0].childNodes[1].childNodes.childNodes -> []

document.childNodes[1].childNodes[2] === document.body true


pedac
-----

input - id
output - two dimensional array

domTreeTracer(1); -> [["ARTICLE"]]
domTreeTracer(2); -> [["HEADER", "MAIN", "FOOTER"], ["ARTICLE"]]
domTreeTracer(22); -> [["A"], ["STRONG"], ["SPAN", "SPAN"], ["P", "P"], ["SECTION", "SECTION"], ["HEADER", "MAIN", "FOOTER"], ["ARTICLE"]]

grandest parent element -> 'ARTICLE', using nodeName for capitalized name of element

function domTreeTracer(givenId) {
  var currentNode = document.getElementById(String(givenId));
  var nodeTrace = [];
  var siblings;
  var siblingsArray;

  while (currentNode.nodeName !== 'BODY'){
    siblings = currentNode.parentNode.children;
    siblingsArray = Array.prototype.map.call(siblings, node => node.nodeName);
    nodeTrace.push(siblingsArray);
    currentNode = currentNode.parentNode;
  }

  return nodeTrace;
}