function arrayToNodes(nodes) {
  var parent = document.createElement(nodes[0]);
  var children = nodes[1];

  if (children.length === 0) {
    return parent;
  } else {
    for (var i = 0; i < children.length; i += 1) {
      parent.appendChild(arrayToNodes(children[i]));
    }
  }

  return parent; // 
}

var nodes = ["BODY",[["DIV",[["DIV",[]],["DIV",[["DIV",[]]]]]],["DIV",[]],["DIV",[["DIV",[]],["DIV",[]],["DIV",[]]]]]];

// var nodes = ["BODY",[["HEADER",[]],["MAIN",[]],["FOOTER",[]]]];

arrayToNodes(nodes);