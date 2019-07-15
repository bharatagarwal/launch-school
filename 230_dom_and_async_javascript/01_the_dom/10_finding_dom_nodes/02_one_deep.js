function findAllParagraphs() {
  var matches = [];
  var nodes = document.body.childNodes;

  for (var i = 0; i < nodes.length; i += 1) {
    console.log(nodes[i]);
  }
}