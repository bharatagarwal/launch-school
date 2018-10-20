# write a function that takes an array, and returns sets of n consective numbers.



def create_set(array, size)
  result = []
  index = 0
  increment = size - 1

  while index + increment < array.size
    result << array[index..index + increment]
    index += 1
  end

  result
end

p create_set([0, 1, 2, 3, 4, 5, 6], 4)
 # == [[0, 1, 2, 3], [1, 2, 3, 4], [2, 3, 4, 5], [3, 4, 5, 6]]