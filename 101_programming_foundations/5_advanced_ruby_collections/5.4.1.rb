[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end

# The Array#map method is being called on the multi-dimensional array [[1,2],[3,4]]. Each inner array is passed on to the block in turn and assigned to the variable arr. The Array#first method is called on arr, adn returns the object at index 0 of the current array - in this case 1 and 3, respectively. The puts method then outputs the string representation of the integer.
# Array#first method is called again, and returns the 0 index of the current arry, and since this is the last expression to be evaluated in the block, is the value returned by it.
# The Array#map method creates a new array with the the return values of the block for transformation, and thus a new one-dimensional array is created from this method.

Line | Action | Object | Side Effect | Return value | Is return value used?
1 | map | outer array | none | [1,3] | no
1-4 | block | sub-array | none | integer at index 0 of sub array | yes, by map for transformation
2 | first | each sub-array | none | 0 index | used by puts
2 | puts  | o index obj | outputs string rep of int | nil | no
3 | first | sub-array | none | 0 index | yes, return value of block

