// var scissors = {
//   id: 0,
//   name: 'Scissors',
//   stock: 8,
//   price: 10,
//   setPrice: function(price) {
//     if (price < 0) {
//       console.log('Price has got to be non-negative!');
//       return;
//     } else {
//       this.price = price;
//     }
//   },
//   describe: function() {
//     console.log(`Name: ${this.name}`);
//     console.log(`ID: ${this.id}`);
//     console.log(`Price: $${this.price}`);
//     console.log(`Stock: ${this.stock}`);
//   },
// };

// var drill = {
//   id: 1,
//   name: 'Drill',
//   stock: 15,
//   price: 45,
//   setPrice: function(price) {
//     if (price < 0) {
//       console.log('Price has got to be non-negative!');
//       return;
//     } else {
//       this.price = price;
//     }
//   },
//   describe: function() {
//     console.log(`Name: ${this.name}`);
//     console.log(`ID: ${this.id}`);
//     console.log(`Price: $${this.price}`);
//     console.log(`Stock: ${this.stock}`);
//   },
// };

// This solution has brought us closer to our object-oriented ideal, but has also introduced some inefficiency, insofar as our setPrice and describe methods are duplicated in each object, and we will have to type out this code for each new object we want to create. One solution to this problem is to stop manually creating each object, and instead use a factory function to generate them. Create a new function createProduct which takes arguments for id, name, stock, and price and also adds setPrice and describe to the new object.

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

var scissors = createProduct(0, 'Scissors', 8, 10);
scissors.describe();

scissors.setPrice(55);
console.log();

scissors.describe();