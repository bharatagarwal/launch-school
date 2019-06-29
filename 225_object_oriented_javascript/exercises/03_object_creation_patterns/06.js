/*
inventory management system
__________

players
----

-- item creator
  - info is present and valid
-- items manager
  - creating items, updating information about items,
  deleting items, and querying information about them
-- reports manager
  - generates reports for specific item or ALL items
    - specific item reports from report objects created
    from report manager
    - report manager is responsible for reports for all
    items


item information requirements
-----

sku code: 'first trhee letters of item' + 
          'first two letters of category'
item name: min 5 characters, space not counted
category: min 5 characters, only one word
quantity: must not be blank, assume a valid number
          provided.
- return an object with a notValid property set to true.
  - this is indicative of a constructor

item manager responsibilities
-----

create:   creates a new item, return false if creation
          not successful
update:   accept an sky code and an object,
          updates any information on it
delete:   accepts an sku code, and deletes item from list
items:    returns all the items
inStock:  list all items with quantity greater than 0
itemsInCategory: list all items for a given category

report manager responsibilities
-----

init:   accepts ItemManager object as an argument, and 
        assigns it to items property
createReporter: accepts an SKU code as argument, and returns
                an object
                  - returned object has one method, itemInfo
                    that logs all properties of a object as 
                    k-v pairs (one pair per line)
reportInStock:  logs all items in stock as comma-separated
                values.

*/

var ItemCreator = (function() {
  function generateSkuCode(itemName, category) {
    return (itemName.replace(/\s/g, '').slice(0, 3).toUpperCase() +
            category.replace(/\s/g, '').slice(0, 2).toUpperCase());
  }

  function isValidItemName(itemName) {
    return itemName.replace(/\s/g, '').length >= 5;
  }

  function isValidCategory(category) {
    return category.replace(/\s/g, '').length >= 5 && category.split(' ').length === 1;
  }

  function isQuantityProvided(quantity) {
    return quantity !== undefined
  }

  return function(itemName, category, quantity) {
    if (isValidItemName(itemName) && isValidCategory(category) && isQuantityProvided(quantity)) {
      this.skuCode = generateSkuCode(itemName, category);
      this.itemName = itemName;
      this.category = category;
      this.quantity = quantity;
    } else {
      return { notValid: true };
    }
  };
})();

var ItemManager = {
  items: [],
  getItem: function(skuCode) {
    return this.items.filter(function(item) {
      return item.skuCode === skuCode;
    })[0];
  },

  create: function(itemName, category, quantity) {
    var item = new ItemCreator(itemName, category, quantity);
    if (item.notValid) {
      return false;
    } else {
      this.items.push(item);
    }
  },

  update: function(skuCode, itemInformation) {
    Object.assign(this.getItem(skuCode), itemInformation);
  },

  delete: function(skuCode) {
    // this.items.splice(this.items.indexOf(this.getItem(skuCode)), 1);
    this.items = this.items.filter(item => item.skuCode !== skuCode);
  },

  list: function() {
    return this.items;
  },

  inStock: function() {
    return this.items.filter(function(item) {
      return item.quantity > 0;
    });
  },

  itemsInCategory: function(category) {
    return this.items.filter(function(item) {
      return item.category === category;
    });
  },
};

var ReportManager = {
  init: function(itemManagerObject) {
    this.items = itemManagerObject;
  },

  createReporter: function(skuCode) {
    // return (function() {
      var item = this.items.getItem(skuCode);
      return {
        itemInfo: function() {
          Object.keys(item).forEach(function(key) {
            console.log(key + ': ' + item[key]);
          });
        },
      };
    // }).bind(this)();
  },

  reportInStock: function() {
    console.log(this.items.inStock().map(item =>item.itemName).join(', '));
  },
}


ItemManager.create('basket ball', 'sports', 0);
ItemManager.create('soccer ball', 'sports', 5);
ItemManager.create('football', 'sports', 3);
ItemManager.create('kitchen pot', 'cooking', 3);

console.log('after creation: ');
console.log(ItemManager.items); 
console.log('-------------')
console.log('');

ItemManager.update('SOCSP', { quantity: 0 });

console.log('in stock: ');
console.log(ItemManager.inStock()); 
console.log('-------------')
console.log('');

console.log('in category sports: ');
console.log(ItemManager.itemsInCategory('sports'));
console.log('-------------')
console.log('');

ItemManager.delete('SOCSP');
console.log('after deletion of soccer ball: ');
console.log(ItemManager.items);
console.log('-------------')
console.log('');

ReportManager.init(ItemManager);

console.log('items in stock:');
ReportManager.reportInStock();
console.log('-------------')
console.log('');

var kitchenPotReporter = ReportManager.createReporter('KITCO');
console.log(`items with SKU code KITCO:`);
kitchenPotReporter.itemInfo();
console.log('-------------')
console.log('');

var basketBallReporter = ReportManager.createReporter('BASSP');
console.log(`items with SKU code BASSP:`);
basketBallReporter.itemInfo();