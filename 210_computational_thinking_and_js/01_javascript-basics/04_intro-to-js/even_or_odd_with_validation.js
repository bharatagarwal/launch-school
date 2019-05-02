function evenOrOdd(parameter) {
  if (typeof(parameter) !== 'number'){
    console.log('Not a valid number');
    return;
  }

  if (parameter % 2 === 0)
    console.log('even');
  else
    console.log('odd');
}

evenOrOdd('5');
evenOrOdd(5);
evenOrOdd(2);