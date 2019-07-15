// Write a function that will take a short line of text, and write it to the console log within a box.

function characterRepeated(character, length) {
  let string = '';

  for (let i = 0; i < length; i += 1) {
    string += String(character);
  }

  return string;
}

function logInBox(sentence) {
  let length = sentence.length;
  let horizontal_line = `+-${characterRepeated('-', length)}-+`;
  let blank_line = `| ${characterRepeated(' ', length)} |`;

  console.log(horizontal_line);
  console.log(blank_line);
  console.log(`| ${sentence} |`);
  console.log(blank_line);
  console.log(horizontal_line);
}

logInBox('To boldly go where no one has gone before.');

// +--------------------------------------------+
// |                                            |
// | To boldly go where no one has gone before. |
// |                                            |
// +--------------------------------------------+

logInBox('');

// +--+
// |  |
// |  |
// |  |
// +--+
