// You can think of the scientific classification of an animal as a series of key-value pairs. Here, the keys are taxonomic ranks (Domain, Kingdom, Phylum, etc.). The values are the specific groups to which the animal belongs.

// Write JavaScript code that extracts the classification of animals from the web page and logs an Object that uses the ranks as keys and the groups as values. You may assume the taxonomic ranks to use as keys is provided for you as an array.

var taxonomicRanks = ['Kingdom', 'Phylum', 'Class', 'Order', 'Family', 'Genus', 'Species'];

var tableRows = document.querySelectorAll('.biota tr');
var tableRowArray = Array.prototype.slice.call(tableRows, 0);
var taxonomicRows = tableRowArray.filter(row => row.textContent.trim().match(/[a-z]*:/));

var taxonomicDetails = {};

taxonomicRows.forEach(row => {
    taxonomicDetails[row.firstElementChild.textContent.slice(0, -1)] = row.lastElementChild.textContent
});

var returnObject = {};

taxonomicRanks.forEach(rank => {
  returnObject[rank] = taxonomicDetails[rank];
})

console.log(returnObject);