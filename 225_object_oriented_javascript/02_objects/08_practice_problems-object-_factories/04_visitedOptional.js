function makeCountry(name, continent, visited) {
  return {
    name: name,
    continent: continent,
    visited: visited === undefined ? false : visited,
    // visited is an optional parameter
    getDescription: function() {
      return this.name + ' is located in ' + this.continent + '.';
    },
  }
}