function logMultiples(number) {
  var multiple = Math.floor(100 / number) * number;

  while (multiple > 0) {
    if (multiple % 2 === 1) {
      console.log(multiple);
    }

    multiple -= number;
  }
}

logMultiples(17);
logMultiples(21);