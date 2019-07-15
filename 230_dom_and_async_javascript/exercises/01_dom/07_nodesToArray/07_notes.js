// Implement a function that converts the DOM, starting from the body, to nested arrays. Each element in the DOM is represented as ["PARENT_TAG_NAME", [children]] where children are elements as well and as such follow the same format. When an element has no children, it's represented as ["PARENT_TAG_NAME", []]. For instance, if the HTML doesn't have any elements inside the body, the result array would be: ["BODY", []]. Likewise, if the HTML only has a div element as its content, the result array would be: ["BODY", [["DIV", []]]].

// Go over the examples below to better visualize how the DOM is represented as nested arrays.

// example 1
> nodesToArr();
= ["BODY", [
    ["HEADER", []],
    ["MAIN", []],
    ["FOOTER", []]]]

document.body 
-> header, main, footer
[document.body.tagName, Array.from(document.body.children)] 
-> ['BODY', [header, main, footer]
['BODY', [[header.tagName, Array.from(header.children), [main.tagName], Array.from(main.children)], [footer.tagName, Array.from(footer.children)]]
-> ['BODY', [['HEADER', []], ['MAIN', []], ['FOOTER', []]]

// ParentNode.childElementCount
function f(node) {
  if (node.childElementCount === 0) return [node.tagName, []];
  return ([node.tagName, Array.from(node.children).map(node => f(node))]);
}
// [document.body]
// first round [document.body, children]
// second round [document.body, [children, [subchildren]]]

// example 2
> nodesToArr();
= ["BODY", [
    ["HEADER", []],
    ["MAIN", [
      ["DIV", []],
      ["DIV", []]]],
    ["FOOTER",[]]]]

// example 3
> nodesToArr();
= ["BODY", [
    ["DIV", [
      ["DIV", []],
      ["DIV", [
        ["DIV",[]]]]]],
    ["DIV", []],
    ["DIV", [
      ["DIV", []],
      ["DIV", []],
      ["DIV", []]]]]]

