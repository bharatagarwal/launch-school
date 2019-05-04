function incrementProperty(object, property) {
  if (Object.keys(object).includes(property)) {
    object[property] += 1;  
  } else {
    object[property] = 1;
  }

  return object[property];
}

var wins = {
  steve: 3,
  susie: 4,
};

cl(incrementProperty(wins, 'susie'));
cl(wins);
cl(incrementProperty(wins, 'lucy'));
cl(wins);