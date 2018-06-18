# Write a method that takes an Array of numbers, and returns an Array with the same number of elements, and each element has the running total from the original Array.

# problem
# accept array and pass total of array length at that point
# return an array

# algorithm
# create a new array
# reduce original array
# pass sum to new array at every point in the array as it is being reduced.



def running_total(array)
  new_array = []
  array.reduce(0) do |sum, number|
    new_array << sum + number
    sum + number
  end
  new_array
end

# def running_total(array)
#   sum = 0
#   array.each_with_object([]) do |num, new_array| 
#     sum += num
#     new_array << sum 
#   end
# end

# LS solution
# def running_total(array) 
#   sum = 0
#   array.map { |value| sum += value }
# end

p running_total([2, 5, 13])
p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []