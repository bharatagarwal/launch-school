function isBalanced(string) {
  let onlyParantheses = string.replace(/[^()]/g, '');
  let parensCount = 0;
  let i;
  

  for (i = 0; i < onlyParantheses.length; i += 1) {
    onlyParantheses[i] === '(' ? parensCount += 1 : parensCount -= 1;
    if (parensCount < 0) return false;
  }

  return parensCount === 0;
}

console.log(isBalanced('What (is) this?'));        // true
console.log(isBalanced('What is) this?'));         // false
console.log(isBalanced('What (is this?'));         // false
console.log(isBalanced('((What) (is this))?'));    // true
console.log(isBalanced('((What)) (is this))?'));   // false
console.log(isBalanced('Hey!'));                   // true
console.log(isBalanced(')Hey!('));                 // false
console.log(isBalanced('What ((is))) up('));       // false