def multiply_all_pairs(first_array, second_array)
  pairs = []
  first_index = 0
  second_index = 0

  while first_index < first_array.length
    while second_index < second_array.length
      pairs << first_array[first_index] * second_array[second_index]
      second_index += 1
    end
    second_index = 0
    first_index +=1
  end

  pairs.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]