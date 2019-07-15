// Add an onclick event to the element we show and hide above. This time, the function should set the class of the element to 'hidden'. This event will let you hide the visible element by clicking on it. As with the previous function, the first thing the function should do is invoke e.preventDefault().

// Inside your function, this points to the current DOM element, which means that you can use this.setAttribute to change its class; you don't have to locate it first with getElementById.

document.getElementById('toggle').onclick = event => {
  event.preventDefault();
  document.getElementById('notice').classList.toggle('hidden');
  document.getElementById('notice').classList.toggle('visible');
};


document.getElementById('notice').onclick = function(event) {
  event.preventDefault();
  this.classList.toggle('hidden');
  this.classList.toggle('visible');
};
