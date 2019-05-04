function radiansToDegrees(radians) {
  // pi radians = 180 degress
  // 1 radian = 180 / pi

  return (radians * 180 / Math.PI)
}

console.log(radiansToDegrees(Math.PI));