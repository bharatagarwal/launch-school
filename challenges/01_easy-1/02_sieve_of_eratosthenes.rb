require "pry"

# Write a program that uses the Sieve of Eratosthenes to find all the primes from 2 up to a given number.

# The Sieve of Eratosthenes is a simple, ancient algorithm for finding all prime numbers up to any given limit. It does so by iteratively marking as composite (i.e. not prime) the multiples of each prime, starting with the multiples of 2.

# The algorithm consists of repeating the following over and over:
# - take the next available unmarked number in your list (it is prime)
# - mark all the multiples of that number (they are not prime)

# Repeat until you have processed each number in your range. When the algorithm terminates, all the numbers in the list that have not been marked are prime. The wikipedia article has a useful graphic that explains the algorithm.

# problem
# examples
# 10 => [2, 3, 5, 7] 
# from 2..10
# 2, 3, 4, 5, 6, 7, 8, 9, 10
# 2, 3, 5, 7, 9
# 2, 3, 5, 7

# 22
# 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22
# 2, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21
# 2, 5, 7, 11, 13, 17, 19

# data structures
# input: integer
# output: array
# intermediate: convert range from 2 to number to array

# algorithms
# iterate over range from 2 to number
# delete from array if number is a multiple of 2.

class Sieve
  def initialize number
    @number = number
    @prime_numbers = (2..number).to_a
  end

  def primes
    (2..@number).each do |num|
      @prime_numbers.select! { |n| n == num || n % num != 0}
    end

    @prime_numbers
  end
end