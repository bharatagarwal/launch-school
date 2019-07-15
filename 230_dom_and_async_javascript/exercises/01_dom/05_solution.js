function colorGeneration(count) {
  if (count < 1) {
    return 'nothing to do';
  }

  var elements = Array.from(document.body.children);
  count -= 1;

  while (count > 0) {
    elements = elements.map(element => Array.from(element.children)).flat();
    count -= 1;
  }

  elements.forEach(element => element.classList.toggle('generation-color'));
}
