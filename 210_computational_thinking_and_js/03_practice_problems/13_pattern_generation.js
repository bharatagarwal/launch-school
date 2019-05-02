// Write a function that takes a number of rows as the argument n and logs a square of numbers and asterisks. For example, if n is 7, log the following pattern:

// generatePattern(7);

// // console output
// 1******
// 12*****
// 123****
// 1234***
// 12345**
// 123456*
// 1234567

function generatePattern(number) {
  let string;
  let initial;
  let number_cursor;
  let star_cursor;

  for (initial = 1; initial <= number; initial += 1) {
    string = '';
    for (number_cursor = 1; number_cursor <= initial; number_cursor += 1) {
      string += String(number_cursor);
    }

    for (star_cursor = initial + 1; star_cursor <= number; star_cursor += 1){

      string += `${'*' * (star_cursor.toString().length)}`;
    }

    console.log(string);
  }
}