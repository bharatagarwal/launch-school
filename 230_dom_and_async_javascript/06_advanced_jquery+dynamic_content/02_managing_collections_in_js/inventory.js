var inventory;

(function() {
  inventory = {
    collection: [],
    // ...
    setDate: function() {
      // ...
    },
    init: function() {
      this.setDate();
      // ...
    },
  };
  // no return, just assignment.  
}());

$(inventory.init.bind(inventory));
// what's the need for binding? because context is jquery.
// this is equivalent to callback for DOMContentLoaded to fire.