var obj = {
  count: 2,
  method: function() {
    return this.count;
  },
};

obj.method();
// this points to the `obj` object