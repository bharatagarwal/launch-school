// Make a Stack

// A stack is a compound data type like an array. The difference between an array and a stack is that in an array you can insert and remove elements in any order you want, but a stack has a rule whereby you can only add new elements at the end and remove the last inserted element.

// Create a function newStack, that when called returns a stack object with three methods: push, pop, and printStack. push takes a value and insert it at the end of the stack. pop removes the last element from the stack. printStack logs each remaining element of the stack on its own line.

// Internally, use an array to implement the stack. Make sure that the array is not accessible from outside the methods.

function newStack() {
  var stack = [];

  return {
    push: function(value) {
      stack.push(value);
    },
    pop: function() {
      if (stack.length === 0) {
        console.log('Stack is empty.');
        return;
      }

      stack.pop()
    },
    printStack: function() {
      stack.forEach(el => console.log(el));
    }
  }
}

var stack = newStack();
stack.push(11);
stack.push(16);
stack.push(9);
stack.pop(9);
stack.printStack();

var stack2 = newStack();
stack2.printStack(); // no output