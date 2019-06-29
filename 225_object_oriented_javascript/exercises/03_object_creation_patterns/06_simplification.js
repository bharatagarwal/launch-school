var ItemManager = (function(){
  var items = [];

  function createItem(name, category, quantity) {
    return {
      sku: (name.slice(0, 3) + category.slice(0, 2)).toUpperCase(),
      name: name,
      category: category,
      quantity: quantity,
    };
  }

  return {
    create: function(name, category, quantity) {
      var newItem = createItem(name, category, quantity);
      items.push(newItem);
    },

    delete: function(skuCode) {
      let itemsLength = items.length;
      items = items.filter(item => item.sku !== skuCode);

      return items.length !== itemsLength ? true : false;
    },

    // items: items,
    items: function() {
      return items;
    }
  };
})();

console.log(ItemManager.create('basket ball', 'sports', 0));
console.log(ItemManager.create('soccer ball', 'sports', 5));
console.log(ItemManager.create('football', 'sports', 3));
console.log(ItemManager.create('kitchen pot', 'cooking', 3));
console.log(ItemManager.items());
console.log(ItemManager.delete('SOCSP'));
console.log(ItemManager.items());