function cleanUp(string) {
  let cleanedUpString = '';

  for (let i = 0; i < string.length; i += 1) {
  
    if (string[i].match(/[a-zA-Z]/)) {
      cleanedUpString += string[i];
    } else if (cleanedUpString[cleanedUpString.length - 1] !== ' ') {
      cleanedUpString += ' ';
    }
  }

  return cleanedUpString;
}

console.log(cleanUp("---what's my +*& line?"));    // " what s my line "
