var person = {
  firstName: 'Rick ',
  lastName: 'Sanchez',
  fullName: this.firstName + this.lastName,
};

console.log(person.fullName); // Rick Sanchez

// What is This

// Read the following code carefully. What do you think is logged on line 7. Try to answer the question before you run the code.

// If object properties refer to `this`, it'll only be the global object.
// if they refer to 