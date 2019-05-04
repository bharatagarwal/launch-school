function concat(array1, secondArgument) {
  // second argument can be an array or something else. 
  newArray = array1.slice();
  
  if (Array.isArray(secondArgument) === false) {
    newArray.push(secondArgument);
  } else {
    secondArgument.forEach((term) => {
      newArray.push(term);
    });
  }

  return newArray;
}

