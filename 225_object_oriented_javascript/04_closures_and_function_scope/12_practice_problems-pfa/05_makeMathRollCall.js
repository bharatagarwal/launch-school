// Implement makeMathRollCall such that it returns a partially applied rollCall function, with the subject as 'Math'.

var subjects = {
  English: ['Bob', 'Tyrone', 'Lizzy'],
  Math: ['Fatima', 'Gary', 'Susan'],
  Biology: ['Jack', 'Sarah', 'Tanya'],
};

function rollCall(subject, students) {
  console.log(subject + ':');
  students.forEach(function(student) {
    console.log(student);
  });
}

function makeMathRollCall() {
  return function(students) {
    rollCall('Math', students);
  };
}

var mathRollCall = makeMathRollCall();
mathRollCall(subjects['Math']);
// => Math:
// => Fatima
// => Gary
// => Susan
