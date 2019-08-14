var inventory;

// - put current date & time in the #order_date element 
// retrieve template string in script element,
// set it to template property of inventory object.

(function() {

  function cacheTemplate() {
      var template = document.querySelector('#inventory_item');
      inventory.template = Handlebars.compile(template.textContent);
      template.parentNode.removeChild(template);
    }

  inventory = {
    collection: [],
    lastId: 0,
    // array of objects in the format: { id: number, name: string, stockNumber: string, quantity: number }
    setDate: function() {
      document.querySelector('#order_date').textContent = new Date().toUTCString();
    },

    get: function(id) {
      var currentItem = this.collection.filter(item => item.id === id)[0];
      if (currentItem) return currentItem;
      return false;
    },

    add: function() {
      this.lastId += 1;

      var item = {
        id: this.lastId,
        name: '',
        stockNumber: '',
        quantity: 1,
      };

      this.collection.push(item);
      return item;
    },

    update: function(tableRow) {
      var currentId = this.findId(tableRow);
      var currentItem = this.get(currentId);
      currentItem.name = tableRow.querySelector(`input[name*='item_name']`).value;
      currentItem.stockNumber = tableRow.querySelector(`input[name*='item_stock']`).value;
      currentItem.quantity = tableRow.querySelector(`input[name*='item_quantity']`).value;
    },

    newItem: function(e) {
      e.preventDefault(); // just to be safe.
      var item = this.add();
      // var itemHTML = this.template.replace(/ID/g, item.id);
      // var parser = new DOMParser();
      // var htmlNodes = parser.parseFromString(itemHTML, "text/html");
      // var inputNodes = Array.from(htmlNodes.body.children);
      // var table = document.querySelector('#inventory');
      // inputNodes.forEach( node => table.appendChild(node));
      // for a simple template:
      // $item = $(this.template.replace(/ID/g, item.id));
      $item = $(this.template({id: item.id}));

      $('#inventory').append($item);
      // jquery does a better job of parsing compared to innerHTML, which is just raw.
    },

    removeFromCollection: function(id) {
      this.collection = this.collection.filter(item => item.id !== id );
    },

    deleteItem: function(e) {
      e.preventDefault();
      var tableRow = this.findTableRow(e);

      tableRow.parentNode.removeChild(tableRow);
      
      var currentId = this.findId(tableRow);
      this.removeFromCollection(currentId);
    },

    findTableRow: function(e) {
      return $(e.target).closest('tr')[0];
      // can't find an equivalent for closest in vanilla javascript
      // implement own?
      // return e.target.parentNode.parentNode;
    },

    findId: function(tableRow) {
      return parseInt(tableRow.querySelector('input[type=hidden]').value, 10);
    },

    updateItem: function(e) {
      var tableRow = this.findTableRow(e);

      this.update(tableRow);
    },

    bindEvents: function() {
      document.querySelector('#add_item').addEventListener('click', this.newItem.bind(this));
      document.querySelector('#inventory').addEventListener('click', function(e) {
        if (e.target.tagName === 'A' && e.target.classList.contains('delete')) this.deleteItem(e);
      }.bind(this));

      document.querySelector('#inventory').addEventListener('blur', function(e) {
        this.updateItem(e);
      }.bind(this), true);

      // document.querySelector('input[type=submit]').addEventListener('submit') {
        
      // }
    },

    init: function() {
      this.setDate();
      cacheTemplate();
      this.bindEvents();
    },

  };
})();

// $(inventory.init.bind(inventory));
document.addEventListener('DOMContentLoaded', function(e) {
  inventory.init();

});

// Passing a method to another function causes its lose its context and therefore it's necessary to pass in a function that is permanently bound to a context. Or you can supply a function expression:
// because the function gets renamed to the parameter name for the function.

