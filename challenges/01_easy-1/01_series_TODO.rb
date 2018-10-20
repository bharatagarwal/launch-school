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

# examples
# data structures
# algorithm

class Series
  def initialize(string)
    @string = string
  end

  def slices(length)
    return nil if length > @string.length
  end
end

p Series.new('92834').slices(1) == [[9], [2], [8], [3], [4]]
p Series.new('98273463').slices(2) ==  [[9, 8], [8, 2], [2, 7], [7, 3], [3, 4], [4, 6], [6, 3]]
p Series.new('982347').slices(3) ==  [[9, 8, 2], [8, 2, 3], [2, 3, 4], [3, 4, 7]]
