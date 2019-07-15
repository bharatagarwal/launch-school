// In this problem and the next, we'll use the onclick Element property. You don't need to know much about onclick right now, but take a minute to read this link. We'll learn more about onclick later when we talk about event listeners. For now, the onclick property lets you detect when the user clicks an element.

// Our page has an element that you can't see initially; it's hidden. When the user clicks the link, the browser should display the hidden item; the next click on that link should hide the revealed item. Each click should toggle the hidden element between the visible and hidden states.

// Use the Inspector to find the hidden element and determine its ID. Following this, set the onclick property on the link with an ID of toggle to a function that makes the element visible when it's hidden and hides it when it's visible. You can use getAttribute to access the class, and setAttribute to set it; the class names of interest are 'visible' and 'hidden'.

document.getElementById('toggle').onclick = event => {
  event.preventDefault();
  document.getElementById('notice').classList.toggle('hidden');
  document.getElementById('notice').classList.toggle('visible');
};

// Your function should take a single argument, e. The first line of your function should invoke e.preventDefault(). We'll discuss this later when we talk more about events, but, for now, just be aware that preventDefault() tells your browser that it shouldn't try to follow the link.