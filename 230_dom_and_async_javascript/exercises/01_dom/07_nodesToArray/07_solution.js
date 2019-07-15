function nodesToArray() {
  var startingPoint = document.body;
  return splitRecursively(startingPoint);
}

function splitRecursively(node) {
  if (node.children.length === 0) {
    return [node.tagName, []];
  }

  return [node.tagName, 
          Array.from(node.children).map(node => {
            return splitRecursively(node);
         })];
}