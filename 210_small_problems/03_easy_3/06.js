function isPalindrome(string) {
  return string === string.split('').reverse().join('');
}

function isRealPalindrome(string) {
  return isPalindrome(string.toLowerCase().replace(/[^a-z0-9]/g, ''));
}

function isPalindromicNumber(number) {
  number = parseInt(String(number), 10)
  return isRealPalindrome(String(number));
}

// console.log(isPalindromicNumber(34543));        // true
// console.log(isPalindromicNumber(123210));       // false
// console.log(isPalindromicNumber(22));           // true
// console.log(isPalindromicNumber(5));            // true
console.log(isPalindrome('0880')); // true
console.log(isPalindromicNumber(0880)); // false/