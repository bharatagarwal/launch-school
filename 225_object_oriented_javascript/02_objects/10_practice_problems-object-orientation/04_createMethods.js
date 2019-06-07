// We want our code to take an object-oriented approach to keeping track of the products, and although the functions we just wrote work fine, since they are manipulating data in the objects, we should place them in the objects themselves. Rewrite the code such that the functions describeProduct and setProductPrice become methods describe and setPrice on both our scissors and drill objects.

var scissors = {
  id: 0,
  name: 'Scissors',
  stock: 8,
  price: 10,
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

var drill = {
  id: 1,
  name: 'Drill',
  stock: 15,
  price: 45,
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

drill.describe();
console.log('')
drill.setPrice(11);
drill.describe();
