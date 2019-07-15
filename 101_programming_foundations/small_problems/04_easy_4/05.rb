# Write a method that searches for all multiples of 3 or 5 that lie between 1 and some other number, and then computes the sum of those multiples. For instance, if the supplied number is 20, the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

# You may assume that the number passed in is an integer greater than 1.

# algorithm
# create an empty array
# From 1..number, iterate and check
# if number is divisible by 3 or 5, append to array
# reduce array and return sum

def multisum(number)

  (1..number).reduce(0) do |sum, num|
    if num % 3 == 0 || num % 5 == 0
      sum + num
    else
      sum
    end
  end

end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168