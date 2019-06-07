var chile = {
  name: 'The Republic of Chile',
  continent: 'South America',
  getDescription: function() {
    return this.name + ' is located in ' + this.continent + '.';
  },
};

var canada = {
  name: 'Canada',
  continent: 'North America',
  getDescription: function() {
    return this.name + ' is located in ' + this.continent + '.';
  },
};

var southAfrica = {
  name: 'The Republic of South Africa',
  continent: 'Africa',
  getDescription: function() {
    return this.name + ' is located in ' + this.continent + '.';
  },
};

// getDescription is the same for all three
// continent and name are different and what makes them unique.