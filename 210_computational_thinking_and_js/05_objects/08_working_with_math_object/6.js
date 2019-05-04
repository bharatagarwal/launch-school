function random(min, max) {
  if (min === max) return min;

  let nums = [max, min].sort();

  difference = nums[1] - nums[0] + 1;

  return Math.floor(Math.random() * difference) + min;
}