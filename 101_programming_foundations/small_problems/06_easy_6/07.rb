# Write a method that takes an Array as an argument, and returns two Arrays that contain the first half and second half of the original Array, respectively. If the original array contains an odd number of elements, the middle element should be placed in the first half Array.


# [1, 2, 3, 4].size    == 4
#  0, 1; 2, 3
# first_of_last_array = (size/2.0).round(0)

# [1, 5, 2, 4, 3].size == 5
#  0, 1, 2; 3, 4
# first_of_last_array = (size/2.0).round(0)


def halvsies(array)
  first = []
  second = []
  
  first_of_last_array = (array.size/2.0).round(0)

  array.each_with_index do |num, index|
    if index < first_of_last_array
      first << num
    else
      second << num
    end
  end
  [first, second]

end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]