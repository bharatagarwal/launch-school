var nodes = ["BODY",[["HEADER",[]],["MAIN",[]],["FOOTER",[]]]];

currentParent = document.body;
nodes.pop();
nodes = nodes[0];

for (let i = 0; i < nodes.length; i += 1) {
  
}

- iterate over given node-children set
- create node with given tagName and currentParent in first element, and look at second member of array. 
  if second is member is empty, move on to the next member of array


- see subarray, iterate over subarray

- append each child 

// OR
//
// ["BODY", [
//   ["HEADER", []],
//   ["MAIN", []],
//   ["FOOTER", []]]]

arrayToNodes(nodes);

// Nested array of nodes
var nodes = ["BODY",[["DIV",[["DIV",[]],["DIV",[["DIV",[]]]]]],["DIV",[]],["DIV",[["DIV",[]],["DIV",[]],["DIV",[]]]]]];

// OR
//
// ["BODY", [
//   ["DIV", [
//     ["DIV", []],
//     ["DIV", [
//       ["DIV",[]]]]]],
//   ["DIV", []],
//   ["DIV", [
//     ["DIV", []],
//     ["DIV", []],
//     ["DIV", []]]]]]

arrayToNodes(nodes);