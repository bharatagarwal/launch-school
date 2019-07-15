function walk(node) {
  console.log(node.nodeName);
  for (let i = 0; i < node.childNodes.length; i += 1) {
    walk(node.childNodes[i]);
  }
}

walk(document.body);