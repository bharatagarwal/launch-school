var studentGrades = [
  { name: 'StudentA', grade: 90.1 },
  { name: 'StudentB', grade: 92 },
  { name: 'StudentC', grade: 91.8 },
  { name: 'StudentD', grade: 95.23 },
  { name: 'StudentE', grade: 91.81 },
];

function compareGrades(student1, student2) {
  if (student1.grade > student2.grade) {
    return -1;
  } else if (student1.grade < student2.grade) {
    return 1;
  } else {
    return 0;
  }
}

// -1 => student1 precedes student2 in final order
// 1 => student2 precedes student1 in final order
// 0 => their order remains, relative to each other.

// studentGrades.sort(function (student1, student2) {
//   if (student1.grade < student2.grade) {
//     return 1;
//   } else if (student1.grade > student2.grade) {
//     return -1;
//   } else {
//     return 0;
//   }
// });

console.log(studentGrades.sort(compareGrades));