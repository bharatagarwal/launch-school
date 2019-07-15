/* 
<ul id="list">
  <li class="list-item">Item 1</li>
  <li class="list-item">Item 1</li>
  <li class="list-item">Item 1</li>
</ul>
*/

var list = document.querySelector('#list');
var listItems = document.getElementsByClassName('list-item');
console.log(listItems.length);  // logs 3

// We'll cover creating elements in a later assignment
var newItem = document.createElement('p');   // Creates a new element
newItem.className = 'list-item';             // adds a class to the element
list.appendChild(newItem);                   // appends to "list" element

console.log(listItems.length);  // logs 4