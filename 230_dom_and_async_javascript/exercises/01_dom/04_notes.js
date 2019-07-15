// Implement a function, sliceTree, that is "similar" to the Array.prototype.slice method, but this time for a DOM tree. The sliceTree function takes two arguments: the start index which is the parent node's id attribute and, the end index which is the innermost child node's id attribute. The function returns an array of tagNames. Take note of the following when implementing the sliceTree function:

// It's similar to slice but different in the sense that slice isn't inclusive on the right hand side.
// The end index doesn't have to be the id of the "innermost" child node as some of the examples suggest.
// Only consider element nodes.
// Only elements that have body as an ancestor (parent, grandparent, etc.) are sliceable.
// If the id attribute of the start or end index is not in the DOM, return undefined.
// If the slice is not feasible — there's no path connecting the element at the starting index to the ending index — return undefined.

input -> two integers, start index (parents id) & end index(innermost child node id), inclusive on the right side
output -> one dimensional array of tagNames or undefined
- only elements that have body as an ancestor
- if id of starting or ending is not in dom, return undefined
- if theres no path connecting the two nodes, return undefined

function sliceTree(start, end) {
  var startElement = document.getElementById(start);
  var endElement = document.getElementById(end);
  if (!startElement || !endElement) {
    return undefined;
  }

  var slicedTree = [];
  var currentElement = endElement;

  while (currentElement.id >= String(start) && currentElement.tagName !== 'BODY') {
    console.log(endElement);
    slicedTree.unshift(endElement.tagName);
    endElement = endElement.parentElement;
  }

  if (currentElement.id === String(start)) {
    return slicedTree;
  } else {
    return undefined;
  }
}



sliceTree(1, 4);  // ["ARTICLE", "HEADER", "SPAN", "A"]
sliceTree(1, 76); // undefined // terminates because end is not there
sliceTree(2, 5);  // undefined // terminates at 5
sliceTree(5, 4);  // undefined // terminates because order is screwed up (own guard clause), or undefined when empty?
sliceTree(1, 23); // ["ARTICLE", "FOOTER"] // terminate when the path doesn't work, and start afresh with an alternative path
sliceTree(1, 22); // ["ARTICLE", "MAIN", "SECTION", "P", "SPAN", "STRONG", "A"]
sliceTree(11, 19); // ["SECTION", "P", "SPAN", "STRONG", "A"]