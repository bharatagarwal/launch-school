# Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. The length of the string should match the given integer.

# problem
# input: a positive number
# output: a string, with 1 and 0 alternating, upto length of number entered

# data structure
# input: positive numeral
# output: string

# algorithm
# use #.times
# append 1 to string if index is odd
# append 0 if index is even

def stringy(numeral, first = 1)
  string = ''
  second = [0, 1].delete_if { |num| num == first }.first
  numeral.times do |n| # n is from index 0 to index n-1
    string << first.to_s if (n+1).odd?
    string << second.to_s if (n+1).even?
  end

  string
end

puts stringy(6)
puts stringy(6,0)
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'