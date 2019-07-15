// itereate over childNodes of body
// push to an array created just for the function

// can alernatively use a filter function

function findAllParagraphs() {
  var matches = [];
  var nodes = document.body.childNodes;

  for (var i = 0; i < nodes.length; ++i) {
    if (nodes[i] instanceof HTMLParagraphElement) {
      matches.push(nodes[i]);
    }
  }

  return matches;
}

console.log(findAllParagraphs());