// itereate over childNodes of body
// push to an array created just for the function

// can alernatively use a filter function

function findAllParagraphs() {
  var nodes = document.body.childNodes;
  return Array.prototype.filter.call(nodes, node => node instanceof HTMLParagraphElement);
}

console.log(findAllParagraphs());