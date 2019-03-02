# Write a method that takes one argument, a string containing one or more words, and returns the given string with all (five or more) letter words reversed. Each string will consist of only letters and spaces. Spaces should be included only when more than one word is present.

# problem
# input: sentence
# output: sentence, with word reversed if it is of length 5 or greater.

# examples
# given already

# algorithm
# Split string with space as a seperator
# Map over resulting Array, reversing word if length is greater than 5
# Join the contents of the array back to a sentence with space as a seperator.

def reverse_words(string)
  words = string.split(' ')
  words = words.map do |word|
            if word.length >= 5
              word.reverse
            else
              word
            end
          end
  words.join(' ')

end

puts reverse_words('Professional') == 'lanoisseforP'
puts reverse_words('Walk around the block') == "Walk dnuora the kcolb"
puts reverse_words('Launch School') == "hcnuaL loohcS"