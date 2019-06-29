// Implement the following diagram using the pseudo-classical approach. Subclasses should inherit everything from the superclass and not just the methods. Reuse the constructors of the superclass when implementing a subclass.

// Person:
// ------
// firstName
// lastName
// age
// gender
// __________
// fullName()
// communicate()
// eat()
// sleep()


function Person(firstName, lastName, age, gender) {
  this.firstName = firstName;
  this.lastName = lastName;
  this.age = age;
  this.gender = gender;
}

Person.prototype.fullName = function() {
  return (this.firstName + ' ' + this.lastName);
}

Person.prototype.communicate = function() {
  console.log(`Hi I'm ${this.firstName}.`);
}

Person.prototype.eat = function() {
  console.log(`Nom nom.`);
}

Person.prototype.sleep = function() {
  console.log(`Zzzzz...`);
}

// Doctor is a Person
// -----
// specialisation
// __________
// diagnosis()


function Doctor(firstName, lastName, age, gender, specialisation) {
  Person.call(this, firstName, lastName, age, gender);
  this.specialisation = specialisation;
}

// Object.setPrototypeOf(Doctor.prototype, Person.prototype);
Doctor.prototype = Object.create(Person.prototype);
Doctor.prototype.constructor = Doctor;

Doctor.prototype.diagnose = function() {
  console.log(`Please sit on the chair.`);
}

// Professor is a Person
// -----
// subject
// __________
// teach()


function Professor(firstName, lastName, age, gender, subject) {
  Person.call(this, firstName, lastName, age, gender);
  this.subject = subject;
}

Professor.prototype = Object.create(Person.prototype);
Professor.prototype.constructor = Professor;

Professor.prototype.teach = function() {
  console.log(`Today I'm goint to teach you ${this.subject}.`);
}

// Student is a Person
// -----
// degree
// __________
// study()


function Student(firstName, lastName, age, gender, degree) {
  Person.call(this, firstName, lastName, age, gender);
  this.degree = degree;
}

Student.prototype = Object.create(Person.prototype);
Student.prototype.constructor = Student;

Student.prototype.study = function() {
  console.log(`Hey, I study ${this.degree}.`);
}

// GraduateStudent is a Student
// -----
// graduateDegree
// __________
// research()

function GraduateStudent(firstName, lastName, age, gender, degree, graduateDegree) {
  Student.call(this, firstName, lastName, age, gender, degree)
  this.graduateDegree = graduateDegree;
}

GraduateStudent.prototype = Object.create(Student.prototype);
GraduateStudent.prototype.constructor = GraduateStudent;

GraduateStudent.prototype.research = function() {
  console.log(`I'm researching with an aim to get a degree in ${this.graduateDegree}.`);
}

// -----------------------------------

var person = new Person('foo', 'bar', 21, 'gender');
console.log(person instanceof Person);     // logs true
person.eat();                              // logs 'Eating'
person.communicate();                      // logs 'Communicating'
person.sleep();                            // logs 'Sleeping'
console.log(person.fullName());            // logs 'foo bar'

var doctor = new Doctor('foo', 'bar', 21, 'gender', 'Pediatrics');
console.log(doctor instanceof Person);     // logs true
console.log(doctor instanceof Doctor);     // logs true
doctor.eat();                              // logs 'Eating'
doctor.communicate();                      // logs 'Communicating'
doctor.sleep();                            // logs 'Sleeping'
console.log(doctor.fullName());            // logs 'foo bar'
doctor.diagnose();                         // logs 'Diagnosing'

var graduateStudent = new GraduateStudent('foo', 'bar', 21, 'gender', 'BS Industrial Engineering', 'MS Industrial Engineering');
// logs true for next three statements
console.log(graduateStudent instanceof Person);
console.log(graduateStudent instanceof Student); 
console.log(graduateStudent instanceof GraduateStudent);
graduateStudent.eat();                     // logs 'Eating'
graduateStudent.communicate();             // logs 'Communicating'
graduateStudent.sleep();                   // logs 'Sleeping'
console.log(graduateStudent.fullName());   // logs 'foo bar'
graduateStudent.study();                   // logs 'Studying'
graduateStudent.research();                // logs 'Researching'