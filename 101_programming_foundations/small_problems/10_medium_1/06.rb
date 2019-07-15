NUMBERS = %w(zero one two three four five six seven eight nine)

# Write a method that takes a sentence string as input, and returns the same string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

# problem
# input: string
# output: string with numbers in place

# algorithm

def word_to_digit(string)

  NUMBERS.each do |word|
    string.gsub!(/\b#{word}\b/, NUMBERS.index(word).to_s)
  end

  string
end

p word_to_digit('Please call me at five five five one two three four. Thanks.')
 # == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
