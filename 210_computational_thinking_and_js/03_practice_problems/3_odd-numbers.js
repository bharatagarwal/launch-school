function logOddNumbers(number) {
  let num  = 1

  while (num <= number) {
    if (num % 2 === 1) console.log(num);
    num += 1;
  }
}

logOddNumbers(19);

/* 
output on console
1
3
5
7
9
11
13
15
17
19 
*/