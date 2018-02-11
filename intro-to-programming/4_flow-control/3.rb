# Write a program that takes a number from the user between 0 and 100 and reports back whether the number is between 0 and 50, 51 and 100, or above 100.

def num_info number
  if number >= 0 && number <= 50
    return '0-50'
  elsif number >=51 && number <=100
    return '51-100'
  elsif number > 100
    return '100+'
  end
end

p num_info 2
p num_info 77
p num_info 124