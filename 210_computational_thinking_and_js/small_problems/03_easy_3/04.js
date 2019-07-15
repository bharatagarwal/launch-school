function isPalindrome(string) {
  for (let i = 0; i < (Math.round(string.length / 2) - 1); i+= 1) {
    if (string[i] !== string[string.length - 1 - i]) {
      return false;
    }    
  }

  return true;
}

// also, (string === string.split('').reverse().join(''))

isPalindrome('madam');               // true
isPalindrome('Madam');               // false (case matters)
isPalindrome("madam i'm adam");      // false (all characters matter)
isPalindrome('356653');              // true