var bands = [
  { name: 'sunset rubdown', country: 'UK', active: false },
  { name: 'women', country: 'Germany', active: false },
  { name: 'a silver mt. zion', country: 'Spain', active: true },
];


function processBands(data) {
  return bands
           .map((bandObject) => {
              return {
                name: cleanUp(bandObject.name),
                country: 'Canada',
                active: bandObject.active
              }
           });
}

function cleanUp(bandName) {
  return bandName
           .split(' ')
           .map((word) => capitalizeWord(word))
           .join(' ')
           .replace(/\./g, '')
}

function capitalizeWord(word) {
  return word[0].toUpperCase() + word.slice(1);
}

console.log(processBands(bands));
console.log(bands);

// should return:
// [
//   { name: 'Sunset Rubdown', country: 'Canada', active: false },
//   { name: 'Women', country: 'Canada', active: false },
//   { name: 'A Silver Mt Zion', country: 'Canada', active: true },
// ]