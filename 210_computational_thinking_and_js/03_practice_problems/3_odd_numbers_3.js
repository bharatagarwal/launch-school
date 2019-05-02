function logOddNumbers(number) {
  let num  = 0
  let isOdd = (num % 2 === 1);
  if (!isOdd) number -= 1;
  
  while (num <= number) {
    num += 1;
    if (num + 1 % 2 === 0) continue;
    console.log(num);
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