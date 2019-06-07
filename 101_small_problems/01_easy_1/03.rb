# Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.

# problem description
# input: Check for positive and Integer
# output: Array composed of Integers broken down to digits

# examples

# data structure
# input - integer
# output - array

# algorithm

# Convert to Integer to String
# Split string by ''
# Map each array element and convert from String to Integer
# Return array

def positive_integer?(value)
  value.is_a?(Integer) && value.to_i > 0
end

def digit_list(number)
  if positive_integer?(number)
    number = number.to_s
    numbers = number.split('')
    numbers.map do |num|
      num.to_i
    end
  else
    puts "Please enter a positive integer: "
    number = gets.chomp.to_i
    digit_list(number)
  end
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]
p digit_list('444') # => asks for a positive integer to be entered.
