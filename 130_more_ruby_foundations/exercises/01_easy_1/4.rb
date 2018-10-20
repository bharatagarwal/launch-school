require "pry"

# Write a method that returns a list of all of the divisors of the positive integer passed in as an argument. The return value can be in any sequence you wish.

def divisors(number)
  sqrt = Math.sqrt(number).floor
  (1..sqrt).each_with_object([]) do |n, div|
    if number % n == 0
      div << n
      div << number / n
    end
  end.uniq.sort
end

# def divisors(number)
#   (1..number).select do |n|
#     number % n == 0 
#   end
# end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
p divisors(999962000357)