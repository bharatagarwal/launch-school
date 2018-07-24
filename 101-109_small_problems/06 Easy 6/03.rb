# The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...) such that the first 2 numbers are 1 by definition, and each subsequent number is the sum of the two previous numbers. This series appears throughout the natural world.

# Computationally, the Fibonacci series is a very simple series, but the results grow at an incredibly rapid rate. For example, the 100th Fibonacci number is 354,224,848,179,261,915,075 -- that's enormous, especially considering that it takes 6 iterations before it generates the first 2 digit number.

# Write a method that calculates and returns the index of the first Fibonacci number that has the number of digits specified as an argument. (The first Fibonacci number has index 1.)

# problem
# calculate at which iteration does fibonacci number hit the given number of digits


# data structure
# input in Integer
# convert output of number to string and find length to see the number of digits
# return index

# algorithm

# use while loop, continuing loop till length of fibonacci number matches given number
# return the argument passed to fibonacci number function.

def fibonacci(number)
  return 1 if number == 1
  return 1 if number == 2
  fibonacci(number - 1) + fibonacci(number - 2)
end

def find_fibonacci_index_by_length(length)
  index = 1

  while fibonacci(index).to_s.length < length
    index += 1
  end

  index
end

p find_fibonacci_index_by_length(2)
p fibonacci(find_fibonacci_index_by_length(2))
p find_fibonacci_index_by_length(3)
p fibonacci(find_fibonacci_index_by_length(3)-1)
p fibonacci(find_fibonacci_index_by_length(3)-1)
p fibonacci(find_fibonacci_index_by_length(3))
p find_fibonacci_index_by_length(4)
p fibonacci(find_fibonacci_index_by_length(4)-1)
p fibonacci(find_fibonacci_index_by_length(4)-2)
p fibonacci(find_fibonacci_index_by_length(4))
p find_fibonacci_index_by_length(10)
# find_fibonacci_index_by_length(100) == 476
# find_fibonacci_index_by_length(1000) == 4782
# find_fibonacci_index_by_length(10000) == 47847