var rectangles = [[3, 4], [6, 6], [1, 8], [9, 9], [2, 2]];

console.log(totalArea(rectangles));    // 141

function totalArea(rectangles) {
  // map and convert to areas
  // reduce and get sum of elements

  return rectangles
          .map((pair) => pair[0] * pair[1])
          .reduce((sum, areas) => sum + areas);

}