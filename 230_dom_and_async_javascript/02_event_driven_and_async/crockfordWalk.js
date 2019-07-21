function walkTheDoc(node, func) {
  func(node);

  node = node.firstChild;
  while (node) {
    walkTheDoc(node, func);
    node = node.nextSibling;
  }
}