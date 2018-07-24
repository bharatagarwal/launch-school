# Write a method that takes an Array, and returns a new Array with the elements of the original list in reverse order. Do not modify the original list.

# You may not use Array#reverse or Array#reverse!, nor may you use the method you wrote in the previous exercise.

# Examples:

def reverse(array)
  reversed_array = array.dup
  # if no dup, then they point to the same object.
  size = reversed_array.length

  number_of_swaps = size.even? ? size / 2 : (size - 1)/2

  (0..(number_of_swaps - 1)).each do |distance|
    reversed_array[distance], reversed_array[(size - 1) - distance] = reversed_array[(size - 1) - distance], reversed_array[distance]
  end

  reversed_array
end

list = [1,2,3,4]
p list
p list.object_id

reversed = reverse(list)

p reversed
p list.object_id
p reversed.object_id




# reverse(%w(a b c d e)) == %w(e d c b a)  # => true
# reverse(['abc']) == ['abc']              # => true
# reverse([]) == []                        # => true

list = [1, 2, 3]                      # => [1, 2, 3]
new_list = reverse(list)              # => [3, 2, 1]
list.object_id != new_list.object_id  # => true
list == [1, 2, 3]                     # => true
new_list == [3, 2, 1]                 # => true