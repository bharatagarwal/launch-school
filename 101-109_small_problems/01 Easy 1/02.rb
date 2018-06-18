# Write a method that takes one integer argument, which may be positive, negative, or zero. This method return true if the number's absolute value is odd. You may assume that the argument is a valid integer value.

# p
# input: integer
# output: true or false, depending on whether absolute value of integer is odd or even.

# e
# given in question.

# d
# integers. no need to validate as all examples have given integers as input.

# a
# convert integer to absolute value
# check for oddness and give a boolean return.

def absolute_value(number)
  if number > 0
    number 
  elsif number > 0
    number * -1
  elsif number == 0
    0
  end
end

def is_odd?(number)
  number = absolute_value(number)
  
  # if number.remainder(2) != 0
  if number % 2 == 1
    true
  else
    false
  end
end

puts is_odd?(2) == false
puts is_odd?(5) == true
puts is_odd?(-17) == true
puts is_odd?(-8) == false
puts is_odd?(0) == false
puts is_odd?(7) == true