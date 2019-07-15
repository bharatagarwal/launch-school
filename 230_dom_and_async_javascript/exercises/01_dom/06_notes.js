// Write a function that takes two element ids as arguments and swaps the positions of the elements represented by the ids. The function returns true for valid swaps and undefined for invalid. To put the focus on the node swapping functionality, you can assume that nodes will have a value for the id attribute and two arguments will always be provided. Use the following HTML and sample codes to test your output:

invalid swap if - 
at least one of the id attributes doesnt exist
at least one of the nodes is a "child" of the other

parent.replaceChild(node, targetNode) 

replacedNode = parentNode.replaceChild(newChild, oldChild);

newChild is the new node to replace oldChild. If it already exists in the DOM, it is first removed.
oldChild is the existing child to be replaced.
replacedNode is the replaced node. This is the same node as oldChild.