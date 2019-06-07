# Write a method that takes two arguments, a string and a positive integer,
# and prints the string as many times as the integer indicates.

# problem breakdown
# input - string, and integer > 0
# output - string in a newline, the same number of times.

# examples
# repeat('Hello', -3)
# repeat('Hello', 3)
# repeat('Hello', '4')
# repeat("Hello", 0)
# repeat(44, 3)
# repeat(false, 5)

# data structures
# String and Integer, to be checked for both arguments passed to method

# algorithm
# check if first argument is a string and second argument is a positive number
# if so, use #.times to puts the string
# if first argument is a string, but second is not a positive number, offer a 
# chance to change inout
# if second argument is not a positive number, offer a chance to enter a number
# if neither argument is valid, offer a chance to fix the input.

def positive_integer?(value)
  value.is_a?(Integer) && value.to_i > 0
end

def content_inside_string_a_valid_integer?(content)
  if content == '0'
    true
  elsif content.to_i.to_s == content
    true
  else
    false
  end
end

def get_string_input(string, number)
  puts "Please enter a valid string: "
  string = gets.chomp
  repeat(string, number)
end

def get_number_input(string, number)
  puts "Please enter a valid positive number: "
  number = gets.chomp
  if content_inside_string_a_valid_integer?(number)
    number = number.to_i
    repeat(string, number)
  else
    repeat(string, number)
  end
end

def repeat(string, number)
  if string.is_a?(String) && positive_integer?(number)
    number.times do
      puts string
    end
  elsif !string.is_a?(String) && positive_integer?(number)
    get_string_input(string, number)
  elsif string.is_a?(String) && !positive_integer?(number)
    get_number_input(string, number)
  elsif !string.is_a?(String) && !positive_integer?(number)
    get_string_input(string, number)
  end
end

repeat(44, -3)
