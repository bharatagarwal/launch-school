if (condition1) {
  // ...
  if (condition2) {
    // 1
  } else {
    // 2..
  }
} else {
  // 3.. ~~ forgot that it coule be just 3, even if
  if (condition4) { // conditions 4 and 5 are not met.
    // 4..
    if (condition5) {
    // 5..
    }
  }
}