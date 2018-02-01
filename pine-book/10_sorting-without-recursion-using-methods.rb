# using selection sort
# learnt to go through ruby documentation and find the relevant 
# method, in this case it's replace_at

original = ["i'm", "feeling", "blue", "let's", "do", "something", "new"]


# wrapper for providing empty sorted array
def sort_array array
  return sort_array_method array, []
end


def sort_array_method original, sorted

  lowest = original[0]

  while original.length > 0

    # finding lowest
    original.each do |value|
      if value < lowest
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