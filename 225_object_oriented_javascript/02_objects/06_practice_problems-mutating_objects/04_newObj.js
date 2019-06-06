var a = 10;
var obj = {
  a: a,
}

var newObj = obj;
newObj.a += 10;

console.log(obj.a === a);
// false
console.log(newObj === obj);
// true