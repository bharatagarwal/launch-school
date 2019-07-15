// Write some JavaScript code to retrieve a word count for each h2 heading on the page.

var h2Elements = document.querySelectorAll('h2');

Array.prototype.map.call(h2Elements, element => element.textContent.split(' ').length);
// [1, 3, 3, 3, 1, 2, 4, 1, 5, 2, 2, 1, 1, 2, 2, 2]