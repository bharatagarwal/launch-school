# write a method that takes two numbers and outputs the primes between them.

def is_prime?(number)
  return false if number == 1

  (2..(number - 1)).each do |num|
    if number % num == 0
      return false
    end
  end

  true
end

def find_primes(first, second)
  (first..second).select { |num| is_prime?(num)}
end

p is_prime?(11)
p is_prime?(10)

p find_primes(3,10)
p find_primes(5,20)