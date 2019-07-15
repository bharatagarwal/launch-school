# Build a program that displays when the user will retire and how many years she has to work till retirement.

# What is your age? 30
# At what age would you like to retire? 70

# It's 2016. You will retire in 2056.
# You have only 40 years of work to go!

CURRENT_YEAR = Time.now.year

puts "What is your age?"
age = gets.chomp.to_i

puts "At what age would you like to retire?"
retirement_age = gets.chomp.to_i

puts "It's #{CURRENT_YEAR}. You will retire in #{CURRENT_YEAR + ( retirement_age - age) }."
puts "You have only #{retirement_age - age} years of work to go!"