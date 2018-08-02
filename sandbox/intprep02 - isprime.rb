def is_prime?(number)
  return false if number == 1

  (2...number).all? do |num|
    number % num != 0
  end
end

p is_prime?(5)
p is_prime?(15)