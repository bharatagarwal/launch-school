function penultimate(string) {
  //return string.split(' ')[-2];
  return string.split(' ').slice(-2, -1).pop();
}

console.log(penultimate('last word'));                    // expected: "last"
console.log(penultimate('Launch School is great!'));      // expected: "is"