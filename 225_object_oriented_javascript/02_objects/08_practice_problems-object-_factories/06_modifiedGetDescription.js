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
      return this.name + ' is located in ' + this.continent + '.' + 
      ' I ' + `${ this.visited ? `have` : `haven't` }` + ' visited ' + this.name + '.';
    },
  }
}

let canada = makeCountry('Canada', 'North America');
console.log(canada.getDescription());

let chile = makeCountry('Chile', 'South America', true);
console.log(chile.getDescription());