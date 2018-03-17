# What method could you use to find out if a Hash contains a specific value in it? Write a program to demonstrate this use.

hometown = {bharat: 'Delhi', agni: 'Bangalore', chetan: 'Mumbai'}

value_to_check = 'Mumbai'
value_to_check_fail = 'Sydney'

p hometown.select { |k,v| v==value_to_check }
p hometown.select { |k,v| v==value_to_check_fail }.empty?

puts

p hometown.has_value?(value_to_check)
p hometown.has_value?(value_to_check_fail)