function logOddNumbers(number) {
  let num  = 1
  let isOdd = (num % 2 === 1);
  if (!isOdd) number -= 1;
  
  while (num <= number) {
    if (num % 2 === 1) console.log(num);
    num += 2;
  }
}

logOddNumbers(20);

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