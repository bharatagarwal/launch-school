function walk(node, callback) {
  callback(node);

  for (var i = 0; i < node.childNodes.length; i++) {
    walk(node.childNodes[i], callback);
  }
}

function getElementsByTagName(tagName) {
  var matches = [];

  walk(document.body, node => {
    if (node.nodeName === tagName.toUpperCase()) {
      matches.puhs(node);
    }
  });

  return matches;
}

getElementsByTagName('p').forEach(paragraph => paragraph.classList.add('article-text'));

