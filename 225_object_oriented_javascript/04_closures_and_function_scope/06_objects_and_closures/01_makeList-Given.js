function makeList() {
  var items = [];

  return function(newItem) {
    var index;
    if (newItem) {
      index = items.indexOf(newItem);
      if (index === -1) {
        items.push(newItem);
        console.log(newItem + ' added!');
      } else {
        items.splice(index, 1);
        console.log(newItem + ' removed!');
      }
    } else {
      if (items.length === 0) {
        console.log('The list is empty.');
      } else {
        items.forEach(function(item) {
          console.log(item);
        });
      }
    }
  };
}

> var list = makeList();
> list('make breakfast');       // add an item to the list
= make breakfast added!
> list();                       // log the list's items
= make breakfast
> list('make breakfast');       // remove an item from the list
= make breakfast removed!
> list();
= The list is empty.