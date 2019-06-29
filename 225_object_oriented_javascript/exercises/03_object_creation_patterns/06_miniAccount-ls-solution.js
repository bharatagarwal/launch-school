var ItemCreator = (function() {
  function generateSkuCode(name, category) {
    return (name.replace(/\s/g, '').slice(0, 3) + category.slice(0, 2)).toUpperCase();
  }

  function validName(name) {
    return name.replace(/\s+/g, '').length >= 5;
  }

  function validCategory(category) {
    if (!/[^a-z0-9]/i.test(category) && category.length >= 5) {
      return true;
    }

    return false;
  }

  function validQuantity(quantity) {
    return quantity !== undefined;
  }

  return function(name, category, quantity) {
    if (validName(name) && validCategory(category) && validQuantity(quantity)) {
      this.skuCode = generateSkuCode(name, category);  
      this.name = name;
      this.category = category;
      this.quantity = quantity;
    } else {
      return { notValid: true };
    }
  };
})();

var ItemManager = {
  items: [],
  getItem: function(givenSkuCode) {
    console.log(this.items)
  },
  
  create: function(itemName, category, quantity) {
    var item = new ItemCreator(itemName, category, quantity);
    if (item.notValid) return false;
    this.items.push(item);
  },

  update: function(skuCode, itemInformation) {
    Object.assign(this.getItem(skuCode), itemInformation);
  },

  delete: function(skuCode) {
    this.items.splice(this.items.indexOf(this.getItem(skuCode)), 1);
  },

  list: function() {
    return this.items;
  },

  inStock: function() {
    return this.items.filter(item => item.quantity > 0);
  },

  itemsInCategory: function(category) {
    return this.items.filter(item => item.category === category);
  },
};

// var ReportManager = {
//   init: function(itemManager) {
//     this.items = itemManager; // assign without revealing
//   },

//   createReporter: function(skuCode) {
//     return (function() {
//       var item = this.items.getItem(skuCode); // only one skuCode
//       console.log(item);
      
//       return {
//         itemInfo: function() {
//           Object.keys(item).forEach(key => {
//             console.log(key + ' : ' + item[key])
//           });
//         },
//       };
//     }).bind(this)();
//   },

//   reportInStock: function() {
//     console.log(this.items.inStock().map(item => item.name).join(', '));
//   },
// };

ItemManager.create('basket ball', 'sports', 0);           // valid item
ItemManager.create('soccer ball', 'sports', 5);           // valid item
ItemManager.create('football', 'sports', 3);              // valid item
ItemManager.create('kitchen pot', 'cooking', 3);          // valid item

debugger;

console.log(ItemManager.items);

ItemManager.update('SOCSP', { quantity: 0 });
console.log(ItemManager.inStock());
// ReportManager.reportInStock();
// logs football,kitchen pot
console.log(ItemManager.itemsInCategory('sports'));
// returns list with the item objects for basket ball, soccer ball, and football
ItemManager.delete('SOCSP');
ItemManager.items;
// returns list with the remaining 3 valid items (soccer ball is removed from the list)

var kitchenPotReporter = ReportManager.createReporter('KITCO');
kitchenPotReporter.itemInfo();
// logs
// skuCode: KITCO
// itemName: kitchen pot
// category: cooking
// quantity: 3

ItemManager.update('KITCO', { quantity: 10 });
kitchenPotReporter.itemInfo();
// logs
// skuCode: KITCO
// itemName: kitchen pot
// category: cooking
// quantity: 10