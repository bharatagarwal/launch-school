function multiplesOfThreeAndFive() {
  let number = 3;
  let target = 100;

  while (number <= target) {
    if (number % 15 === 0) {
      console.log(number.toString() + '!');
    } else if (number % 5 === 0 || number % 3 === 0) {
      console.log(number.toString());
    }
    
    number += 1;
  }
}

multiplesOfThreeAndFive();