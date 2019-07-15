twice(37);          // 74
twice(44);          // 44
twice(334433);      // 668866
twice(444);         // 888
twice(107);         // 214
twice(103103);      // 103103
twice(3333);        // 3333
twice(7676);        // 7676

// length is even
// split into string and compare the left and right side.
// 103103; length = 6 [0..2], [3..5]

function twice(number) {
  if (isDoubleNumber(number)) {
    console.log(number);
  } else {
    console.log(number * 2);
  }
}

function isDoubleNumber(number) {
  if (String(number).length % 2 !== 0) return false;

  let stringRepresentation = String(number);
  let center = stringRepresentation.length / 2;

  return (stringRepresentation.slice(0, center) === stringRepresentation.slice(center));
}