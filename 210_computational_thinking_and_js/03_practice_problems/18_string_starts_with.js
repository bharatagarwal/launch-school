function startsWith(string, searchString) {
  if (searchString.length > string.length) {
    return false;
  } 

  for (let i = 0; i < searchString.length; i += 1) {
    if (string[i] !== searchString[i]) {
      return false;
    }
  }

  return true;
}

var str = 'We put comprehension and mastery above all else';
startsWith(str, 'We');              // true
startsWith(str, 'We put');          // true
startsWith(str, '');                // true
startsWith(str, 'put');             // false

var longerString = 'We put comprehension and mastery above all else!';
startsWith(str, longerString);      // false