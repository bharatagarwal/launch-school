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

// Our new organization also makes it easier to write functions dealing with the products, because we can now take advantage of conventions in the objects' data. Create a function that takes one of our product objects as an argument, and sets the object's price to a non-negative number of our choosing, passed in as a second argument. If the new price is negative, alert the user that the new price is invalid.

function setProductPrice(product, price) {
  if (price < 0) {
    console.log('Price has got to be non-negative!');
    return;
  }

  product.price = price;
}

setProductPrice(drill, 100);
console.log(drill);