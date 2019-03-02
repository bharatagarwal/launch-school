# Write a method that takes one argument, a string, and returns the same string with the words in reverse order.


# problem
# input: should be a string. check for string on input.
#        offer to convert to string and show string reversal.
#        or ask for a new string.

# output: reversed string

# examples

# data structures
# output: string

# algorithm
# Split string by space
# Apply reverse on array
# Join array with space

def reverse_sentence(string)
  string.split(' ').reverse.join(' ')
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'

# reverse_sentence(11)
# reverse_sentence(true)