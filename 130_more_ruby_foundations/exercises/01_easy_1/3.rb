# Write a method that takes a sorted array of integers as an argument, and returns an array that includes all of the missing integers (in order) between the first and last elements of the argument.

# iterate over given numbers
# if difference between current number and next number is greater than 0, then return in between numbers

def missing array
  return [] if array.size < 2
  output = []

  array.each_index do |index|
    if (index + 1) < array.size && (array[index + 1] - array[index]) > 1
      ((array[index] + 1)..(array[index + 1] - 1)).each { |n| output << n }
    end
  end

  output
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []

