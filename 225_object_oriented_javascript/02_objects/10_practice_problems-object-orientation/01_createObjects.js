// Suppose we want to use code to keep track of products in our hardware store's inventory. 

var scissorsId = 0;
var scissorsName = 'Scissors';
var scissorsStock = 8;
var scissorsPrice = 10;

var drillId = 1;
var drillName = 'Cordless Drill';
var drillStock = 15;
var drillPrice = 45;  

// This code presents a number of problems, however. What if we want to add another kind of drill? Given what we've learned about object orientation in the previous assignment, how could we use objects to organize these two groups of data?

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