# The Array#zip method takes two arrays, and combines them into a single array in which each element is a two-element array where the first element is a value from one array, and the second element is a value from the second array, in order. For example:
# [1, 2, 3].zip([4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

def zip(array1, array2)
  index = 0
  size = array1.size
  resultant_array = []

  while index < size
    resultant_array << [array1[index], array2[index]]
    index += 1
  end

  resultant_array
end

zip([1, 2, 3], [4, 5, 6])
 # == [[1, 4], [2, 5], [3, 6]]
