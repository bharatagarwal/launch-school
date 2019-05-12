// Write a function that takes a positive integer, n, as an argument, and logs a right triangle whose sides each have n stars. The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, and the other end at the upper-right.

function triangle(length) {
  for (let i = 1 ; i <= length; i += 1) {
    let spaceCount = length - i;
    let startCount = i;
    let spaceString = '';
    let starString = '';

    while (spaceCount > 0) {
      spaceString += ' ';
      spaceCount -= 1;
    }

    while (startCount > 0) {
      starString += '*';
      startCount -= 1;
    }

    console.log(spaceString + starString);
  }
}

triangle(5);

//     *
//    **
//   ***
//  ****
// *****

triangle(9);

//         *
//        **
//       ***
//      ****
//     *****
//    ******
//   *******
//  ********
// *********