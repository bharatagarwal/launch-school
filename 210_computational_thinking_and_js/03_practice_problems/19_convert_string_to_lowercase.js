// Write a function that returns a string converted to lowercase.

var string = 'A';
asciiNumeric = string.charCodeAt(0);
asciiNumeric += 32;
string = String.fromCharCode(asciiNumeric);  

function toLowerCase(string) {
  // ...
}

toLowerCase('ALPHABET');    // "alphabet"
toLowerCase('123');         // "123"
toLowerCase('abcDEF');      // "abcdef"

function toLowerCase(string) {
  var CONVERSION_OFFSET = 32;
  var newString = '';
  var charCode;
  var i;

  for (i = 0; i < string.length; i += 1) {
    charCode = string.charCodeAt(i);

    if (string[i] >= 'A' && string[i] <= 'Z') {
      charCode += CONVERSION_OFFSET;
    }

    newString += String.fromCharCode(charCode);
  }

  return newString;
}