# Write a program that takes a number from the user between 0 and 100 and reports back whether the number is between 0 and 50, 51 and 100, or above 100.

# Rewrite your program from exercise 3 using a case statement. Wrap this new case statement in a method and make sure it still works.

def num_info number
  case
  when number >=0 && number <=51
    '0-50'
  when number >=51 && number <=100
     '51-100'
  when number > 100
    '100+'
  when number < 0
    '0-'
  end
end

p num_info 2
p num_info 77
p num_info 124
p num_info -11