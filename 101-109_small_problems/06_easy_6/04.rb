# Write a method that takes an Array as an argument, and reverses its elements in place; that is, mutate the Array passed into this method. The return value should be the same Array object.

# You may not use Array#reverse or Array#reverse!.

# problem
# input: array
# input needs to be reversed, and mutated
# return value should be same Array object

# data structures
# input: array
# find if length is odd or even
# if length is even, use parallel assignment
# if length is odd, use parallel assignment except for central item.

# algorithm
# if length of array is even,
# say length is 8, 0,1,2,3,4,5,6,7 . 0,7;1,6;2,5;3,4
# array[0], array[array.length - 1] = ...
# array[1], array[(array.length - 1) - 1]
# do this till length / 2 times from 0..(length/2)-1

# if length of array is odd, lets say 7
# then middle of array, ie 0,1,2,..3..,4,5,6 . 0,6;1,5;2,4
# from 0..(length - 1/2) - 1 times
# array[0], array[6] = ...
# array[1], array[]

def reverse!(array)
  size = array.length

  number_of_swaps = size.even? ? size / 2 : (size - 1)/2

  (0..(number_of_swaps - 1)).each do |distance|
    array[distance], array[(size - 1) - distance] = array[(size - 1) - distance], array[distance]
  end

  array
end

list = [1,2,3,4]
result = reverse!(list) # => [4,3,2,1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id

list = %w(a b c d e)
reverse!(list) # => ["e", "d", "c", "b", "a"]
p list == ["e", "d", "c", "b", "a"]

list = ['abc']
reverse!(list) # => ["abc"]
p list == ["abc"]

list = []
reverse!(list) # => []
p list == []