function makeEvenCounter() {
  var index = 0;
  return function() {
    return index += 2;
  };
}

var evenCounter = makeEvenCounter();

// is 0 eligible for GC here? : ~ yes! because a new function call can reallocate memory. ~ closure created by function returned by makeEvenCounter makes sure this can't be done

// more code