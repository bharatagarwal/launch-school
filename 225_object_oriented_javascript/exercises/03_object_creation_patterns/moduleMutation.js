var test = (function() {
  var array = [1, 2, 3, 4, 5];

  return {
    delete: function(number) {
      array = array.filter(el => el !== number);
    },

    list: function() {
      return array;
    },
  };
})();

console.log(test.list());
test.delete(3);
console.log(test.list());