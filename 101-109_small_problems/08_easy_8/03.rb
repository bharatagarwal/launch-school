# Write a method that returns a list of all substrings of a string that start at the beginning of the original string. The return value should be arranged in order from shortest to longest substring.

# problem
# input: string
# output: array of string

# identify all substrings starting from the first value in the given the string

# xyzzy
# x, xy, xyz, xyzzy

# data structure

# algorithm

# iteration going through the string
# .chars gives you an array with each character being the member of the array
# declare a variable outside of this iteration
# keep appending larger substrings


def substrings_at_start(string)
  substrings = []

  string.chars.each_index do |index|
    substrings << string[0..index]
  end

  substrings
end


p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']