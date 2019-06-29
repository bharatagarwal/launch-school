// Create an object factory for a student object. The student object should have the following methods and it should produce the expected results demonstrated in the sample code:

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

// info: Logs the name and year of the student.
// addCourse: Enrolls student in a course. A course is an object literal that has properties for its name and code.
// listCourses: Returns a list of the courses student has enrolled in.
// addNote: Adds a note property to a course. Takes a code and a note as an argument. If a note already exists, the note is appended to the existing one.
// updateNote: Updates a note for a course. Updating a note replaces the existing note with the new note.
// viewNotes: Logs the notes for all the courses. Courses without notes are not displayed.

foo = createStudent('Foo', '1st');
foo.info();
// 'Foo is a 1st year student'
foo.listCourses();
// [];
foo.addCourse({ name: 'Math', code: 101 });
foo.addCourse({ name: 'Advanced Math', code: 102 });
foo.listCourses();
// [{ name: 'Math', code: 101 }, { name: 'Advanced Math', code: 102 }]
foo.addNote(101, 'Fun course');
foo.addNote(101, 'Remember to study for algebra');
foo.viewNotes();
// // "Math: Fun Course; Remember to study for algebra"
foo.addNote(102, 'Difficult subject');
foo.viewNotes();
// // "Math: Fun Course; Remember to study for algebra"
// // "Advance Math: Difficult Subject"
foo.updateNote(101, 'Fun course');
foo.viewNotes();
// "Math: Fun Course"
// "Advance Math: Difficult Subject"