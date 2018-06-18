# In the previous exercise, you developed a method that converts non-negative numbers to strings. In this exercise, you're going to extend that method by adding the ability to represent negative numbers as well.

# Write a method that takes an integer, and converts it to a string representation.

STRINGS = %w(0 1 2 3 4 5 6 7 8 9)

def integer_to_string(number)

  digits = []

  loop do
    digits << number.remainder(10)
    number /= 10
    break if number == 0
  end

  digits.reverse!

  digits.map { |num| STRINGS[num]}.join
end

def signed_integer_to_string(number)

  sign = if number * -1 > 0
            '-'
         elsif number * -1 < 0
            '+'
         else
            ''
         end

  sign + integer_to_string(number.abs)
end


p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'