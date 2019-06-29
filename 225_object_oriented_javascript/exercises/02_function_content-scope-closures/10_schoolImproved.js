// School Improved
// In an earlier exercise, we created a school object. It works, however, it can still be improved. The following are improvements for you to implement:

/*

- Make the list students private. Right now, anyone can gain access to it and manipulate it.
- Make the constraint for allowed values for years private variable. As a private variable it avoids an unnecessary statement in the addStudent method and at the same time makes the code more declarative.
- Make the getCourse function accessible in the addGrade method also. As it is, only the courseReport method has access.

*/

function createStudent(name, year) {
  return {
    name: name,
    year: year,
    courses: [],
    info: function() {
      console.log(this.name + " is a " + this.year + " student");
    },

    listCourses: function() {
      return this.courses;
    },

    addCourse: function(course) {
      this.courses.push(course);
    },

    addNote: function(courseCode, note) {
      var course = this.courses.filter(function(course) {
        return course.code === courseCode;
      })[0];

      if (course) {
        if (course.note) {
          course.note += '; ' + note;
        } else {
          course.note = note;
        }
      }

    },

    viewNotes: function() {
      this.courses.forEach(function(course) {
        if (course.note) {
          console.log(course.name + ': ' + course.note);
        }
      });
    },

    updateNote: function(courseCode, note) {
      var course = this.courses.filter(function(course) {
        return course.code === courseCode;
      })[0];

      if (course) {
        course.note = note;
      }
    },
  };
}


var createSchool = function() {
  var students = [];
  let allowedYears = ['1st', '2nd', '3rd', '4th', '5th'];

  return { 
    addStudent: function(name, year) {
      if (allowedYears.indexOf(year) >= 0) {
        var student = createStudent(name, year);
        students.push(student);
        return student;
      } else {
        console.log('Invalid Year');
      }
    },

    enrollStudent: function(student, courseName, courseCode) {
      student.addCourse({name: courseName, code: courseCode})
    },

    addGrade: function(student, courseName, grade) {
      var course = this.getCourse(student, courseName);

      if (course) {
        course.grade = grade;
      }
    },

    getReportCard: function(student) {
      student.listCourses().forEach(function(course) {
        if (course.grade) {
          console.log(course.name + ': ' + String(course.grade));
        } else {
          console.log(course.name + ': In progress');
        }
      });
    },
    courseReport: function(courseName) {
      var courseStudents = students.map(function(student) {
        var course = this.getCourse(student, courseName) || { grade: undefined };
        return { name: student.name, grade: course.grade };
      }, this).filter(function(student) {
        return student.grade;
      });

      if (courseStudents.length > 0) {
        console.log('=' + courseName + ' Grades=');

        var average = courseStudents.reduce(function(total, student) {
          console.log(student.name + ': ' + String(student.grade));
          return total + student.grade;
        }, 0) / courseStudents.length;

        console.log('---');
        console.log('Course Average: ' + String(average));
      }
    },
    getCourse: function(student, courseName) {
      return student.listCourses().filter(function(course) {
        return course.name === courseName;
      })[0];
    },
  };
}

let school = createSchool();
var foo = school.addStudent('foo', '3rd');
var bar = school.addStudent('bar', '1st');
var qux = school.addStudent('qux', '2nd');

foo.addCourse({ name: 'Math', code: 101, grade: 95 });
foo.addCourse({ name: 'Advanced Math', code: 102, grade: 90 });
foo.addCourse({ name: 'Physics', code: 202 });

bar.addCourse({ name: 'Math', code: 101, grade: 91 });

qux.addCourse({ name: 'Math', code: 101, grade: 93 });
qux.addCourse({ name: 'Advanced Math', code: 102, grade: 90 })


school.getReportCard(foo);
console.log();
school.getReportCard(bar);
console.log();
school.getReportCard(qux);
// Math: 95
// Advanced Math: 90
// Physics: In progress
console.log();
school.courseReport('Math');

// =Math Grades=
// foo: 95
// bar: 91
// qux: 93
// ---
// Course Average: 93
console.log();
school.courseReport('Advanced Math');
// =Advanced Math Grades=
// foo: 90
// qux: 90
// ---
// Course Average: 90
console.log();
school.courseReport('Physics');
// undefined