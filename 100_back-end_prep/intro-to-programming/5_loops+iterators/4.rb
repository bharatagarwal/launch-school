# Write a method that counts down to zero using recursion.

def count_down_to_zero number
  if number < 0
    puts "Can't count down to zero from a negative number"
  elsif number == 0
    puts 0
  elsif number >= 1
    puts number
    count_down_to_zero number - 1
  end
end

count_down_to_zero 15
count_down_to_zero -11
count_down_to_zero 4
