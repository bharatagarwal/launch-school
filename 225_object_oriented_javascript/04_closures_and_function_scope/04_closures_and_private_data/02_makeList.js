// We'll build a simple todo list program using the techniques we've seen in this assignment. Write a makeList function that returns a new function that implements a todo list. The returned function should have the following behavior:

// When called with an argument that is not already on the list, it adds that argument to the list.
// When called with an argument that is already on the list, it removes the element from the list.
// When called without arguments, it logs all items on the list. If the list is empty, it logs an appropriate message.

function makeList() {
  let list = [];

  return function(argument) {
    if (argument === undefined) {
      if (list.length > 0) {
        list.forEach(element => console.log(element));  
      } else {
        console.log('The list is empty.');
      }

      return;
    }

    if (!list.includes(argument)) {
      list.push(argument);
      console.log(argument + ' added!');
    } else {
      list.splice(list.indexOf(argument), 1);
      console.log(argument + ' removed!');
    }
  };
}

var list = makeList();
list();                 // The list is empty.
list('make breakfast'); // make breakfast added!
list('read book');      // read book added!
list();                 // make breakfast \n read book
list('make breakfast'); // make breakfast removed!
list();                 // read book