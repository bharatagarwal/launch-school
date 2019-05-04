function isXor(first, second) {
  if (!first && second) {
    return true;
  } else if (first && !second) {
    return true;
  } else {
    return false;
  }
}