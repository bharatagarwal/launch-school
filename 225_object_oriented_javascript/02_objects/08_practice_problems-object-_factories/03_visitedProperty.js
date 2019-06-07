function makeCountry(name, continent) {
  return {
    name: name,
    continent: continent,
    visited: false,
    getDescription: function() {
      return this.name + ' is located in ' + this.continent + '.';
    },
  }
}