# Write a program that will take a string of digits and give you all the possible consecutive number series of length n in that string.

# For example, the string "01234" has the following 3-digit series:

# - 012
# - 123
# - 234

# And the following 4-digit series:

# - 0123
# - 1234

# And if you ask for a 6-digit series from a 5-digit string, you deserve whatever you get.

# problem
# input: accept a string representation of a number, which could start with 0.
# give slices of this number, of given size
# if size of slice is longer than the string, then throw an ArgumentError
# examples

# examples
# ('01234').slices(1)
# [[0], [1], [2], [3], [4]]

# ('98273463').slices(2)
# [[9, 8], [8, 2], [2, 7], [7, 3], [3, 4], [4, 6], [6, 3]]
# [0..1], [1..2] and so on
# [0..size - 1], [1.. 1 + (size - 1)], and so on.
# [0...2], [1...3]
# [0...size], [1...size + 1]

# data structures
# input: string
# output: array of arrays containing integer versions of the slices

# algorithm
# start with zero index
# create a slice of given length, starting at zero index
# iterate over array till it ends, parameters being [index..index + size - 1]

class Series
  def initialize(string)
    @string = string
  end

  def slices(length)
    raise ArgumentError if length > @string.size

    slices = []
    index = 0

    while (index + length - 1) < @string.size
      slices << @string.chars[index..index + length - 1].map(&:to_i)
      index += 1
    end

    slices
  end
end