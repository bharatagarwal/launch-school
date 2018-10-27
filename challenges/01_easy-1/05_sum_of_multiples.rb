# Write a program that, given a number, can find the sum of all the multiples of particular numbers up to but not including that number.

# If we list all the natural numbers up to but not including 20 that are multiples of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18. The sum of these multiples is 78.

# Write a program that can find the sum of the multiples of a given set of numbers. If no set of numbers is given, default to 3 and 5.

# problem
# examples
# 10 - 3, 5
# 3, 5, 6, 9
# 8 + 25
# 23

# 20 - 7, 13, 17
# 

class SumOfMultiples
  def initialize(*args)
    @numbers = args == [] ? [3, 5] : args
  end

  def to number
    (1...number)
      .select { |num| @numbers.any? { |n| num % n == 0 } }
      .sum
  end

  def self.to(number)
    new.to(number)
  end
end