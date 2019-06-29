// We can improve the interface by returning an Object from makeList instead of a single Function. If we do that, we can create an API that is easy to use and understand:

function makeList() {
  var items = [];

  return {
    add: function(newItem) {
      var index = items.indexOf(newItem)

      if (index === -1) {
        items.push(newItem);
        console.log(newItem + ' added!');
      }
    },

    remove: function(newItem) {
      let itemIndex = items.indexOf(newItem);
      if (itemIndex !== -1) {
        items.splice(itemIndex, 1);
      }

      console.log(newItem + ' removed!');
    },

    list: function() {
      if (items.length === 0) {
        console.log('The list is empty.')
      } else {
        items.forEach(function(item) {
          console.log(item)
        });
      }
    },
  }
}

var list = makeList();
list.add('peas');
// peas added!
list.list();
// peas
list.add('corn');
// corn added!
list.list();
// peas
// corn
list.remove('peas');
// peas removed!
list.list();
// corn
console.log(list.items); // not accessible