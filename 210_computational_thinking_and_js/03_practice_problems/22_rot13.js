// iterate over each character
// if lowercase, change
// if uppercase, change
// else pass through.

// a -> n
// 'a'.charCodeAt(0) => 97 (97 + 0)
// 'z'.charCodeAt(0) => 122 (97 + 25)
// 'A'.charCodeAt(0) => 65 (65 + 0)
// 'Z'.charCodeAt(0) => 90 (65 + 25)

function rotate(character, characterCase) {
  let startingPoint = characterCase === 'lower' ? 97 : 65;

  let charCode = character.charCodeAt(0);
  let alphabetPlace = charCode - startingPoint;
  let newAlphabetPlace = startingPoint + ((alphabetPlace + 13) % 26);
  return String.fromCharCode(newAlphabetPlace)
}

function rot13(string) {
  let encryptedString = '';
  let newChar;

  for (let i = 0; i < string.length; i += 1) {
    if (string[i] >= 'a' &&  string[i] <= 'z') {
      newChar = rotate(string[i], 'lower');
      encryptedString += newChar;
    } else if (string[i] >= 'A' && string[i] <= 'Z') {
      newChar = rotate(string[i], 'upper');
      encryptedString += newChar;
    } else {
      encryptedString += string[i];
    }
  }

  return encryptedString;
}

console.log(rot13('Teachers open the door, but you must enter by yourself.'));
console.log(rot13(rot13('Teachers open the door, but you must enter by yourself.')));
