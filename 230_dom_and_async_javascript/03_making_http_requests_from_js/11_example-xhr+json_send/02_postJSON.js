var request = new XMLHttpRequest();
request.open('POST', 'https://ls-230-web-store-demo.herokuapp.com/v1/products');

var object = {
  name: 'Ski Board',
  sku: 'SKI230',
  price: 230,
}

var data = JSON.stringify(object);

request.setRequestHeader('Content-Type', 'application/json');
request.setRequestHeader('Authorization', 'token AUTH_TOKEN');

request.send(data);