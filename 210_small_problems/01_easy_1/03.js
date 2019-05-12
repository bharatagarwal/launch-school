// How Big is the Room
// Build a program that asks a user for the length and width of a room in meters, and then logs to the console the area of the room in both square meters and square feet.

// Note: 1 square meter == 10.7639 square feet

// Do not worry about validating the input at this time. Use the prompt() function to collect user input.

// Enter the length of the room in meters:
// 10
// Enter the width of the room in meters:
// 7
// The area of the room is 70.00 square meters (753.47 square feet).

const SQMETERS_TO_SQFEET = 10.7639;
let length = Number(prompt('Enter the length of the room in meters:'));
let width = Number(prompt('Enter the width of the room in meters:'));
let area = length * width;

console.log(`The area of the room is ${area.toFixed(2)} square meters and ${(area * SQMETERS_TO_SQFEET).toFixed(2)} square feet`);
