var myNum = 1;

function foo() {
  var myStr = 'A string';
  // what is eligible for GC here?
}

foo();

// what is eligible for GC here?


// more code

// Are either of the values 1 or "A string" eligible for garbage collection on line 5? What about on line 10? yes, on line 5 myStr can be GC-ed.


// line 5 - nothing
// line 10 - the string inside foo function