// Write a function that takes a year as an argument, and returns the number of 'Friday the 13ths' in that year. You may assume that the year is greater than 1752 (when the modern Gregorian Calendar was adopted by the United Kingdom). You may also assume that the same calendar will remain in use for the foreseeable future.

// create 12 date instances for the month, and get the day from 'getDay'
// 0 for Sunday, 5 for Friday
// monthIndex is zerobased Jan - 0, Dec - 11
// new year, monthIndex, day

function fridayThe13ths(year) {
  let days13th = [];
  for (let i = 0; i < 12; i += 1) {
    days13th.push(new Date(year, i, 13));
  }

  let fridayCount = 0;

  days13th.forEach(day => {
    if (day.getDay() === 5) {
      fridayCount += 1;
    }
  });

  return fridayCount;
}

console.log(fridayThe13ths(1986));      // 1
console.log(fridayThe13ths(2015));      // 3
console.log(fridayThe13ths(2017));      // 2