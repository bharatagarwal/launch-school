function repeat(string, times) {
  if (parseInt(times) < 0 || typeof(times) !== 'number') {
    return undefined;
  }

  let returnString = '';

  for (let i = 0; i < times; i += 1) {
    returnString += string;
  }

  return returnString;
}

repeat('abc', 1);       // "abc"
repeat('abc', 2);       // "abcabc"
repeat('abc', -1);      // undefined
repeat('abc', 0);       // ""
repeat('abc', 'a');     // undefined
repeat('abc', false);   // undefined
repeat('abc', null);    // undefined
repeat('abc', '  ');    // undefined