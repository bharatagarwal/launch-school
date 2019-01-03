# Write a program that can detect palindrome products in a given range.

# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers (range 10 ~ 99) is 9009 = 91 x 99.

# examples
# ----

# .new(max_factor: 9)
# generate # generate array
# largest = palindromes.largest
# 

# data structures
# ----
# 
# 

# algorithm
# ----

class Palindromes
  def initialize(min_factor: 1, max_factor: 100)
    @min = min_factor
    @max = max_factor
  end

  def generate
    @values = {}

    (@min..@max).to_a.repeated_combination(2).each do |(first, second)|
      candidate = first * second
      if candidate.to_s == candidate.to_s.reverse
        if @values[candidate] == nil
          @values[candidate] = [[first, second]]
        else
          @values[candidate] << [first, second]
        end
      end
    end
  end

  def largest
    largest_number = @values.keys.max
    Palindrome.new(largest_number, @values[largest_number])
  end

  def smallest
    smallest_number = @values.keys.min
    Palindrome.new(smallest_number, @values[smallest_number])
  end
end

class Palindrome
  attr_reader :factors
  def initialize(number, factors)
    @number = number
    @factors = factors
  end

  def value
    @number
  end
end