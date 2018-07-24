# Write a method that takes two sorted Arrays as arguments, and returns a new Array that contains all elements from both arguments in sorted order.

# You may not provide any solution that requires you to sort the result array. You must build the result array one element at a time in the proper order.

# Your solution should not mutate the input arrays.

# take first element from first and second arrays
# compare the two, and add lower one to merged array
# move next element of the array from which element was added to merged and so on.

def merge(first_array, second_array)
  return first_array if second_array.empty?
  return second_array if first_array.empty?

  merged_array = []
  first_index, second_index = 0, 0

  while first_index < first_array.length && second_index < second_array.length
    if first_array[first_index] <= second_array[second_index]
      merged_array << first_array[first_index]
      first_index += 1
    else
      merged_array << second_array[second_index]
      second_index += 1
    end

    if first_index == first_array.length
      merged_array << second_array[second_index .. -1]
    elsif second_index == second_array.length
      merged_array << first_array[first_index .. -1]
    end
  end

  merged_array.flatten
end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]