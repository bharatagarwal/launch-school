// Write some JavaScript code to change the color for every other link in the table of contents to green.

var anchors = document.getElementsByTagName('a');

for (var i = 0; i < anchors.length; i += 1) {
  if (i % 2 === 0) anchors[i].style.color = 'green';
}