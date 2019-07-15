// Write some JavaScript code to retrieve the text of every thumbnail caption on the page.

Array.prototype.forEach.call( document.querySelectorAll('.thumbcaption'), caption => console.log(caption.textContent.trim()) );