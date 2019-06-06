// To be a valid triangle, the sum of the angles must be exactly 180 degrees, and every angle must be greater than 0. If either of these conditions is not satisfied, the triangle is invalid.

// Write a function that takes the three angles of a triangle as arguments, and returns one of the following four strings representing the triangle's classification: 'right', 'acute', 'obtuse', or 'invalid'.

// You may assume that all angles have integer values, so you do not have to worry about floating point errors. You may also assume that the arguments are in degrees.

// sort sides of triangle
// check for triange validity
// check longest and return accordingly.

function triangle(...angles) {
  angles = angles.sort((a, b) => a - b);
  if (isValidTriangle(angles)) {
    return getTriangleType(angles[2])
  } else {
    return 'invalid';
  }

}

function isValidTriangle(angles) {
  let sumOfAngles = angles.reduce((sum, num) => sum + num, 0);
  
  if (sumOfAngles !== 180) {
    return false;
  }

  // allNonZero
  if (angles.every(angle => angle > 0)) {
    return true;
  } else {
    return false;
  }

  // return allNonZero && sumOfAngles !== 180
}

function getTriangleType(largest_angle) {
  if (largest_angle > 90) {
    return 'obtuse';
  } else if (largest_angle === 90) {
    return 'right';
  } else {
    return 'acute';
  }
}


// Examples:

console.log(triangle(60, 70, 50));       // "acute"
console.log(triangle(30, 90, 60));       // "right"
console.log(triangle(120, 50, 10));      // "obtuse"
console.log(triangle(0, 90, 90));        // "invalid"
console.log(triangle(50, 50, 50));       // "invalid"