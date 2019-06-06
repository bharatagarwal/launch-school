var myObj = { message: 'Greetings from the global scope!' };

function func(obj) {
  obj.message = 'Greetings from the function scope!';
  console.log(obj.message);
}

func(myObj);
// 'Greetings from the function scope!'

console.log(myObj.message);
// 'Greetings from the function scope!'