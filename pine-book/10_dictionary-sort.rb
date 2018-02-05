# dictionary sort irrespective of case,
# and return array in original case

original = ["i'm", "Feeling", "blue", "Let's", "do", "Something", "new"]


# wrapper for providing empty sorted array
def sort_array array
  return sort_array_method array, []
end


def sort_array_method original, sorted

  lowest = original[0]

  while original.length > 0

    # finding lowest, comparing lowercase-d values to make the sorting case independent
    original.each do |value|
      if value.downcase < lowest.downcase
        lowest = value
      end
      
    end

    # pushing lowest onto a new array
    sorted.push(lowest)
    original.delete_at(original.index(lowest).to_i)

    # resetting lowest
    lowest = original[0]
  end

  return sorted
end


puts 'original array: '
print original
puts
puts 'sorted array: '
print sort_array original
puts