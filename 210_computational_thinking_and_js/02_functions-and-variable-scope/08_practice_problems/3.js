var basket = 'empty';

function goShopping() {
  function shop1() {
    basket = 'tv';
  }

  console.log(basket); // -> empty

  function shop2() {
    basket = 'computer';
  }

  function shop3() {
    var basket = 'play station';
    console.log(basket);
  }

  shop1();
  shop2();
  shop3(); // -> play station 

  console.log(basket); // -> computer 
}

goShopping();