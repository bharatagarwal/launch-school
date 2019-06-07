# Write a method that takes one argument, a positive integer, and returns the sum of its digits.

# problem
# input: enter a positive integer
# output: sum of it's digits

def sum(number)
  number.to_s.split('').map(&:to_i).reduce(:+) # .split('') == .chars
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45