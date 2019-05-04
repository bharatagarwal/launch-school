function splitString(string, delimiter) {
  if (delimiter === undefined) {
    console.log('Error: No delimeter');
    return;
  }

  let currentWord = '';

  for (let i = 0; i < string.length; i += 1) {
    if (delimiter == '') {
      console.log(string[i]);
    } else if (string[i] !== delimiter) {
      currentWord += string[i]
    } else {
      console.log(currentWord);
      currentWord = '';
    }
  }

  if (currentWord !== '') {
    console.log(currentWord);
  }
}

splitString('abc,123,hello world', ',');
// logs:
// abc
// 123
// hello world

splitString('hello');
// logs:
// ERROR: No delimiter

splitString('hello', '');
// logs:
// h
// e
// l
// l
// o

splitString('hello', ';');
// logs:
// hello

splitString(';hello;', ';');
// logs:
//  (this is a blank line)
// hello