// Write a program to determine a student’s grade based on the average of three scores you get from the user. Use these rules to compute the grade:

// If the average score is greater than or equal to 90 then the grade is 'A'
// If the average score is greater than or equal to 70 and less than 90 then the grade is 'B'
// If the average score is greater than or equal to 50 and less than 70 then the grade is 'C'
// If the average score is less than 50 then the grade is 'F'
// You may assume that all input values are valid positive integers.

let score1 = parseInt(prompt("Enter score 1:"));
let score2 = parseInt(prompt("Enter score 2:"));
let score3 = parseInt(prompt("Enter score 3:"));

let average = (score1 + score2 + score3) / 3;

let grade;

if (average >= 90) {
  grade = 'A';
} else if (average >= 70) {
  grade = 'B';
} else if (average >= 50) {
  grade = 'C';
} else if (average < 50) {
  grade = 'F';
}