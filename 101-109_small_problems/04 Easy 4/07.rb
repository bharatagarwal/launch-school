# The String#to_i method converts a string of numeric characters (including an optional plus or minus sign) to an Integer. String#to_i and the Integer constructor (Integer()) behave similarly. In this exercise, you will create a method that does the same thing.

# Write a method that takes a String of digits, and returns the appropriate number as an integer. You may not use any of the methods mentioned above.

# For now, do not worry about leading + or - signs, nor should you worry about invalid characters; assume all characters will be numeric.

# You may not use any of the standard conversion methods available in Ruby, such as String#to_i, Integer(), etc. Your method should do this the old-fashioned way and calculate the result by analyzing the characters in the string.

# problem
# accept string and return number conversion
# split string
# create empty array with intention of taking digits as input
# iterate from 0 to 9 and append to new array when string fits
# multiply by 10^size and add to return new string

def string_to_integer(string)
  digits_string = string.chars

  digits_num = []

  digits_string.each do |digit|
     (0..9).each do |num|
       if digit == num.to_s
         digits_num << num
       end
     end
   end

  # number = 0

  # # digits_num.each_with_index do |num, index|
  # #   number += num * 10**(digits_num.size - 1 - index)
  # # end


  digits_num.reduce(0) do |sum, value|
    10 * sum + value
  end
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

# cleaner, because it doesn't used .to_s, although it sorta
# implicitlu does in the way the hash is defined.
# DIGITS = {
#   '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
#   '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
# }

# def string_to_integer(string)
#   digits = string.chars.map { |char| DIGITS[char] }

#   value = 0
#   digits.each { |digit| value = 10 * value + digit }
#   value
# end