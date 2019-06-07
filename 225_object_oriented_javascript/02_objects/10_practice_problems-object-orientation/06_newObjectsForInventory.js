function createProduct(id, name, stock, price) {
  return {
    id: id,
    name: name,
    stock: stock,
    price: price,
    setPrice: function(price) {
      if (price < 0) {
        console.log('Price has got to be non-negative!');
        return;
      } else {
        this.price = price;
      }
    },
    describe: function() {
      console.log(`Name: ${this.name}`);
      console.log(`ID: ${this.id}`);
      console.log(`Price: $${this.price}`);
      console.log(`Stock: ${this.stock}`);
    },
  };
}

var saw = createProduct(2, 'Circular Saw', 12, 95);
var hammer = createProduct(3, 'Sledge Hammer', 78, 45);
var boxCutter = createProduct(4, 'Box Cutter', 41, 15);

saw.describe();
console.log();

hammer.describe();
console.log();

boxCutter.describe();