# problem
# continuation of the previous problem.
# cycle through the string, and make subsequent as the first character of the substring.

# data structure


# algorithm
# iterate over the size of the string
# keep shortening the string by removing the first character.


def substrings_at_start(string)
  substrings = []

  string.chars.each_index do |index|
    substrings << string[0..index]
  end

  substrings
end

def substrings(string)
  size = string.size
  substrings = []

  (0..size - 1).each do |index|
    substrings << substrings_at_start(string[index..-1])
  end

  substrings.flatten
end

substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]