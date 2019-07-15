function sliceTree(start, end) {
  var startElement = document.getElementById(start);
  var endElement = document.getElementById(end);
  if (!startElement || !endElement) {
    return undefined;
  }

  var slicedTree = [];
  var currentElement = endElement;

  while (currentElement.id !== String(start)) {
    slicedTree.unshift(currentElement.tagName);

    if (currentElement.parentNode.tagName === 'BODY') {
      break;
    }

    currentElement = currentElement.parentNode;
  }

  if (currentElement.id === String(start)) {
    slicedTree.unshift(currentElement.tagName);
    return slicedTree;
  } else {
    return undefined;
  }
}

sliceTree(1, 4);  // ["ARTICLE", "HEADER", "SPAN", "A"]
sliceTree(1, 76); // undefined
sliceTree(2, 5);  // undefined
sliceTree(5, 4);  // undefined
sliceTree(1, 23); // ["ARTICLE", "FOOTER"]
sliceTree(1, 22); // ["ARTICLE", "MAIN", "SECTION", "P", "SPAN", "STRONG", "A"]
sliceTree(11, 19); // ["SECTION", "P", "SPAN", "STRONG", "A"]