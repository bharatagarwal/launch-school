// recursive function's first step, to execute the current object, is to check for instanceof HTMLParagraph element, and then do something with it.

function addClassToParagraphs(node) {
  if (node instanceof HTMLParagraphElement) {
    node.classList.add('article-text');
  }

  var nodes = node.childNodes;
  for (var i = 0; i < nodes.length; ++i) {
    addClassToParagraphs(nodes[i]);
  }
}

addClassToParagraphs(document.body);