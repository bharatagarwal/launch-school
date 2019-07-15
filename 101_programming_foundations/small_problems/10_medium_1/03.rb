# If you take a number like 735291, and rotate it to the left, you get 352917. If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759. Keep the first 3 digits fixed in place and rotate again to get 321597. Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579. The resulting number is called the maximum rotation of the original number.

# Write a method that takes an integer as argument, and returns the maximum rotation of that argument. You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.

# 735291
# -
# 352917
#  -
# 329175
#   -
# 321759
#    -
# 321597
#     -
# 321579

def rotate_array(array)
  new_array = array.dup
  first_element = new_array.shift
  new_array.append(first_element)
  new_array
end

def rotate_rightmost_digits(number, digits)
  return number if digits == 1

  number_string = number.to_s

  steady, rotate = number_string[0..-digits - 1], number_string[-digits..-1]
  
  rotate_chars = rotate_array(rotate.chars)

  (steady + rotate_chars.join('')).to_i
end

def max_rotation(number)
  length = number.to_s.size

  while length > 1
    number = rotate_rightmost_digits(number, length)
    length -= 1
  end

  number
end

# p rotate_rightmost_digits(1234567, 2)
# p rotate_rightmost_digits(1234567, 3)

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845