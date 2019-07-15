function nodeSwap(firstId, secondId) {
  var firstNode = document.getElementById(firstId);
  var secondNode = document.getElementById(secondId);
  if (!firstNode || !secondNode) {
    console.log('returns undefined');
    return;
  }

  var idsOfChildrenOfFirstNode = recordIdsOfChildren(firstNode);
  var idsOfChildrenOfSecondNode = recordIdsOfChildren(secondNode);

  console.log(idsOfChildrenOfFirstNode);
  console.log(idsOfChildrenOfSecondNode);

  if (idsOfChildrenOfFirstNode.includes(String(secondId)) || 
        idsOfChildrenOfSecondNode.includes(String(firstId))) {
    console.log('returns undefined');
    return;
  }

  // replacedNode = parentNode.replaceChild(newChild, oldChild);

  var firstNodeCopy = firstNode.cloneNode(true);
  var secondNodeCopy = secondNode.cloneNode(true);
  firstNode.parentNode.replaceChild(secondNodeCopy, firstNode);
  secondNode.parentNode.replaceChild(firstNodeCopy, secondNode);
}

// alternatively, document.getElementById(1).contains(document.getElementById(4)) => true

function recordIdsOfChildren(givenNode) {
  var children = [];

  walk(givenNode, node => children.push(Array.from(node.children)));

  return children.flat().map(node => node.id).filter(id => id !== "");
}

function walk(node, callback) {
  callback(node);

  for (var i = 0; i < node.children.length; i += 1) {
    walk(node.children[i], callback);
  }
}

nodeSwap(1, 2);