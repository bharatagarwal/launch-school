# Write a method that takes an Array as an argument, and reverses its elements in place; that is, mutate the Array passed into this method. The return value should be the same Array object.

# You may not use Array#reverse or Array#reverse!.

# [1, 2, 3, 4, 5, 6]
# array[0], array[5] swap
# array[0], array[-1]
# array[1], array[4] swap
# array[2], array[-2]
# array[2], array[3] swap
# size = 6
# 0...6 each do index
# array[index], array[-1- index] swap

# [1, 2, 3, 4, 5]
# array[0], array[4] swap
# array[1], array[3] swap
# array[2] remains the same.


def reverse(array)
  new_array = array.dup
  (0...array.size/2).each do |index|
    new_array[index], new_array[-1 - index] = new_array[-1 - index], new_array[index]
  end

  new_array
end

array = [1, 2, 3, 4, 5, 6]
array2 = [1, 2, 3, 4, 5]
p reverse(array)
p array
p reverse(array2)
p array2