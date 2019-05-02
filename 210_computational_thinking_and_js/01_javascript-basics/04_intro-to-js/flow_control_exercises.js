// 1

false || (true && false); // false
true || (1 + 2); // true
(1 + 2) || true; // true. actually 3
true && (1 + 2); // true. actually 3
false && (1 + 2); // false
(1 + 2) && true; // true
(32 * 4) >= 129; // false
false !== !true; //false
true === 4; // false
false === (847 === '847'); // true
false === (847 == '847'); // false
(!true || (!(100 / 5) === 20) || ((328 / 4) === 82)) || false;
// (false || false || true || false -> true

// 2

// Write a function, evenOrOdd, that determines whether its 
// argument is an even number. If it is, the function should log
// 'even' to the console; otherwise, it should log 'odd'. For now,
// assume that the argument is always an integer.

  function evenOrOdd(parameter) {
    if (parameter % 2 === 0)
      console.log('even');
    else
      console.log('odd');
  }

  evenOrOdd(5);
  evenOrOdd(2);