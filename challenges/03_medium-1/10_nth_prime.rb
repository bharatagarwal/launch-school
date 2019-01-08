# Write a program that can tell you what the nth prime is.

# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.


class Prime
  def initialize(number)
    @number = number
  end

  def is_prime?
    return false if @number == 1
    return true if @number == 2

    (2..@number/2).each do |num|
      if @number % num == 0
        return false
      end
    end

    true
  end

  def value
    @number
  end

  def self.nth(n)
    raise ArgumentError if n < 1
    counter = 0
    integer = 2
    number = nil
    
    loop do
      number = new(integer)
      counter += 1 if number.is_prime?
      break if counter == n

      integer += 1
    end

    number.value
  end
end