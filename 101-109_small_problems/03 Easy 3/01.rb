# Write a program that solicits 6 numbers from the user, then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.

# problem
# Accept six numbers, first five of which form a collection
# Check whether the sixth number belongs to the collection or not.

# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 17
# The number 17 appears in [25, 15, 20, 17, 23].


# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 18
# The number 18 does not appear in [25, 15, 20, 17, 23].

TOTAL_NUMBERS = 8

def numberth(number)
  case number.to_s.chars.last
    when '1' then 'st'
    when '2' then 'nd'
    when '3' then 'rd'
    else 'th'
  end
end

def get_numbers
  numbers = []
  (1..(TOTAL_NUMBERS - 1)).each do |index|
    puts "Enter the #{index}#{numberth(index)} number: "
    numbers << gets.chomp.to_i
  end

  puts "Enter the last number: "
  numbers << gets.chomp.to_i

  numbers
end

numbers = get_numbers
last_num = numbers.pop

if numbers.include?(last_num)
  puts "The number #{last_num} appears in #{numbers}."
else
  puts "The number #{last_num} does not appear in #{numbers}."
end