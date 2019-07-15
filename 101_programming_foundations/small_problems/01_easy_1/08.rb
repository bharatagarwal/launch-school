# Write a method that takes one argument, an array containing integers, and returns the average of all numbers in the array. The array will never be empty and the numbers will always be positive integers.

# problem
# input: array with positive integers. ensure array not empty and positive integers used in all.
# output: average of all numbers

# data structure
# input: Array
# output: Integer

# algorithm
# reduce elements of array to sum
# divide sum by size of array
# return that value.

def positive_integer?(value)
  value.is_a?(Integer) && value.to_i > 0
end

def average(array)
  if array.all?{ |val| positive_integer?(val)} && !array.empty?
    value = array.reduce(:+).to_f/array.size
  else
   "Either the array is empty or all values are not positive integers."
  end
end

puts average([1, 3, 3])
puts average([])
puts average([1, -5, 9])
puts average([1, 5, 87, 45, 8, 8])
puts average([9, 47, 23, 95, 16, 52])