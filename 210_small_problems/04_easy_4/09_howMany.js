// Write a function that counts the number of occurrences of each element in a given array. Once counted, log each element alongside the number of occurrences.


function countOccurrences(array) {
  let occurences = array.reduce((occurences, element) => {
           occurences[element] = occurences[element] || 0;
           occurences[element] += 1;
           return occurences;
         }, {});
  log(occurences)
}

function log(object) {
  Object.keys(object).forEach((vehicle) => {
    console.log(`${vehicle} => ${object[vehicle]}`)
  });
}

var vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck',
                'motorcycle', 'motorcycle', 'car', 'truck'];

countOccurrences(vehicles);

// console output
// car => 4
// truck => 3
// SUV => 1
// motorcycle => 2