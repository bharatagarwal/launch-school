function describeProduct(product) {
  console.log(`Name: ${product.name}`);
  console.log(`ID: ${product.id}`);
  console.log(`Price: $${product.price}`);
  console.log(`Stock: ${product.stock}`);
}

var scissors = {
  id: 0,
  name: 'Scissors',
  stock: 8,
  price: 10,
};

var drill = {
  id: 1,
  name: 'Drill',
  stock: 15,
  price: 45,
};

describeProduct(scissors);

console.log();

describeProduct(drill);