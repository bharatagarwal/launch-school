# A Pythagorean triplet is a set of three natural numbers, {a, b, c}, for which, a**2 + b**2 = c**2.
# For example, 3**2 + 4**2 = 9 + 16 = 25 = 5**2.

# problem

# input: 
# a: for object instantiation, three consecutive numbers
# instance methods: sum, product, pythagorean?
# class methods: where

# examples  

# data structures

# algorithms

class Triplet
  def initialize first, second, third
    @numbers = [first, second, third]
  end

  def sum
    @numbers.sum
  end

  def product
    @numbers.reduce(1, :*)
  end

  def pythagorean?
    largest = @numbers.max
    others = @numbers.clone
    others.delete_at(@numbers.index(largest))

    largest**2 == others.reduce(0) { |sum, num| sum + num**2 }
  end

  def self.where(options)
    min = options[:min_factor] || 1
    max = options[:max_factor] || 10
    sum = options[:sum] # could be nil
  end
end