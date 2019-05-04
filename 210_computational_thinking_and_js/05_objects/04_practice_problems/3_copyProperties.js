function copyProperties(original, copy) {
  for (k in original) {
    copy[k] = original[k];
  }

  return Object.keys(original).length;
}

var hal = {
  model: 9000,
  enabled: true,
};

var sal = {};

copyProperties(hal, sal);
console.log(sal);