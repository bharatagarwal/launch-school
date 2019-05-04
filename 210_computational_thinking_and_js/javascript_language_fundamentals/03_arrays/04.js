function concat() {
  var newArray = [];
  var currentArg;
  var i;
  var j;

  for (i = 0; i < arguments.length; i += 1) {
    currentArg = arguments[i];
    // ~~ arguments array available for all functions
    if (Array.isArray(currentArg)) {
      for (j = 0; j < currentArg.length; j += 1) {
        newArray[newArray.length] = currentArg[i];
      }      
    } else {
      newArray[newArray.length] = currentArg;
    }
  }

  return newArray;
}