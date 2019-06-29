// Create a school object. The school object uses the __student object from the previous exercise__. It has methods that use and update information about the student. Be sure to check out the previous exercise for the other arguments that might be needed by the school object.

// addStudent: Adds a student by creating a new student and adding the student to a collection of students. The method adds a constraint that the year can only be any of the following values: '1st', '2nd', '3rd', '4th', or '5th'. Returns a student object if year is valid otherwise it logs "Invalid Year".
// enrollStudent: Enrolls a student in a course.
// addGrade: Adds the grade of a student for a course.
// getReportCard: Logs the grades of a student for all courses. If the course has no grade, it uses "In progress" as the grade.
// courseReport: Logs the grades of all students for a given course name. Only student with grades are part of the course report.

function createSchool() {
  return {
    students: [],
    addStudent: function(student) {
      let validYears = ['1st', '2nd', '3rd', '4th', '5th'];
      if (!validYears.includes(student.year)) {
        console.log("Invalid Year.");
        return;
      }

      this.students.push(student);
    },
    enrollStudent: function(studentName, courseObject) {
      let studentIndex = findStudentIndexByName(studentName)
      if (studentIndex === -1) {
        return "Student not enrolled.";
      }

      this.students[studentIndex].addCourse(courseObject);
    },
    addGrade: function(studentName, courseName, grade) {
      let studentIndex = this.findStudentIndexByName(studentName)
      if (studentIndex === -1) {
        console.log("Student not enrolled in school.");
        return;
      }

      let courseIndex = this.findCourseIndexByName(studentIndex, courseName);
      
      if (courseIndex === -1) {
        console.log("Student not enrolled in course.");
        return;

      }

      this.students[studentIndex].courses[courseIndex].grade = grade;
    },
    getReportCard: function(studentName) {
      let studentIndex = this.findStudentIndexByName(studentName);
      if (studentIndex === -1) {
        console.log("Student not enrolled in school.");
        return;
      }

      this.students[studentIndex].courses.forEach(function(course) {
        console.log(`${course.name}: ${course.grade ? course.grade : 'In progress'}`);
      })
    },
    courseReport: function(courseName) {
      let grades = [];

      this.students.forEach(function(student, Studentindex){
        let courseIndex = this.findCourseIndexByName(Studentindex, courseName);
        
        if (courseIndex === -1 || !student.courses[courseIndex].grade) {
          return;
        }

        let grade = student.courses[courseIndex].grade;
        grades.push({ name: student.name, grade: grade });
      }, this);

      if (grades.length > 0) {
        console.log(`=${courseName}=`);
        grades.forEach(obj => console.log(obj.name + ": " + obj.grade));
        console.log('---');
        console.log('Course Average: ' + grades.map(el => el.grade).reduce((sum, num) => sum + num) / grades.length);
      }
    },
    findStudentIndexByName: function(studentName) {
      let studentIndex;

      for (let i = 0; i < this.students.length; i += 1) {
        if (this.students[i].name === studentName) {
          return i;
        }
      }

      return -1;
    },
    findCourseIndexByName: function(studentIndex, courseName) {
      let currentStudent = this.students[studentIndex]
      for (let i = 0; i < currentStudent.courses.length; i += 1) {
        if (currentStudent.courses[i].name === courseName) {
          return i;
        }
      }

      return -1;
    }
  }
}

function createStudent(name, year) {
  return {
    name: name,
    year: year,
    courses: [],
    info: function() {
      console.log(this.name + ' is a ' + this.year + ' year student');
    },
    addCourse: function(courseObject) {
      this.courses.push(courseObject);
    },
    listCourses: function() {
      console.log(this.courses);
    },
    locateCourseIndex: function(courseCode) {
      for (let i = 0; i < this.courses.length; i += 1) {
        if (this.courses[i].code === courseCode) {
          return i;
        }
      }

      return -1;
    },
    addNote: function(courseCode, note) {
      let courseIndex = this.locateCourseIndex(courseCode);
      if (courseIndex === -1) {
        return;
      }

      if (this.courses[courseIndex].note === undefined) {
        this.courses[courseIndex].note = note;
      } else {
        this.courses[courseIndex].note += '; ' + note;
      }
    },
    updateNote: function(courseCode, note) {
      let courseIndex = this.locateCourseIndex(courseCode);
      if (courseIndex === -1) {
        return;
      }
      
      this.courses[courseIndex].note = note;
    },
    viewNotes: function() {
      this.courses.forEach(function(course) {
        if (course.note !== undefined) {
          console.log(course.name + ': ' + course.note);
        };
      });
    },
  }
}

var foo = createStudent('foo', '3rd');
foo.addCourse({ name: 'Math', code: 101, grade: 95 });
foo.addCourse({ name: 'Advanced Math', code: 102, grade: 90 });
foo.addCourse({ name: 'Physics', code: 202 });

var bar = createStudent('bar', '1st');
bar.addCourse({ name: 'Math', code: 101, grade: 91 });

var qux = createStudent('qux', '2nd');
qux.addCourse({ name: 'Math', code: 101, grade: 93 });
qux.addCourse({ name: 'Advanced Math', code: 102, grade: 90 })

let school = createSchool();
school.addStudent(foo);
school.addStudent(bar);
school.addStudent(qux);

school.getReportCard('foo'); // should it be name or object?
console.log();
school.getReportCard('bar');
console.log();
school.getReportCard('qux');
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