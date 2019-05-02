function logMultiples(number) {
  for (var multiple = Math.floor(100 / number) * number; multiple > 0; multiple -= number) {
    if (multiple % 2 === 1) console.log(multiple);
  }
}

logMultiples(17);
logMultiples(21);