# Write a method that takes an Array of numbers and then returns the sum of the sums of each leading subsequence for that Array. You may assume that the Array always contains at least one number.

# pedac - problem examples data structures algorithm code

# problem
# input: an array of numbers (Integers)
# output: Integer
# [3, 5, 2]
# 3, 3+5 3+5+2
# break down the array
# keep adding the sums of the items in the array
# and return the eventual sum of all sums


# algorithm

# reduce to find the sum
# reduce will have the sum of the array at every point
# declare a variable outside it, and concatenate the sum at that point to the variable
# return the sum of the values
# .sum instead .reduce

def sum_of_sums(array)

  sums_array = []

  sum = 0
  array.each do |value|
    sum += value
    sums_array << sum
  end
  
  sums_array.sum
end

p sum_of_sums([3, 5, 2])
 # == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3])
 # == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35