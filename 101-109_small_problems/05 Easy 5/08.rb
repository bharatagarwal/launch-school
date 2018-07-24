# Write a method that takes an Array of Integers between 0 and 19, and returns an Array of those Integers sorted based on the English words for each number:

# problem
# sort the numbers of a given array based on their english word for each number.

# zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

# data structures
# create an array with index matching english word
# sort array by word
# identify how the indices for each number have changed
# create new array using indices for word array

def alphabetic_number_sort(array)

  words_with_matching_index = %w(zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)

  sorted_words = words_with_matching_index.sort

  new_indices = sorted_words.map do |word|
                  words_with_matching_index.index(word)
                end

  new_indices.map do |index|
    array[index]
  end
end

p alphabetic_number_sort((0..19).to_a)

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]