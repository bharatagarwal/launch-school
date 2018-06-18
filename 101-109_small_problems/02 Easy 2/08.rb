# Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.

# problem
# enter integer greater than 0
# ask for sum or product
# show sum or product

def consecutive_sum(number)
  (1..number).reduce(:+)
end

def consecutive_product(number)
  (1..number).reduce(:*)
end

def input
  puts ">> Please enter a number integer than 0: "
  number = gets.chomp.to_i

  puts ">> Enter 's' to compute the sum, 'p' to compute the product.
"
  choice = gets.chomp
  if choice == 's'
    puts "The sum of the integers between 1 and #{number} is: #{ consecutive_sum(number) }"
  elsif choice == 'p'
    puts "The product of the integers between 1 and #{number} is: #{ consecutive_product(number) }"
  end
end

input
input
