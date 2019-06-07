function makeCountry(name, continent, visited) {
  return {
    name: name,
    continent: continent,
    visited: visited === undefined ? false : visited,
    // visited is an optional parameter
    visitCountry: function() {
      this.visited = true;
    },
    getDescription: function() {
      return this.name + ' is located in ' + this.continent + '.';
    },
  }
}