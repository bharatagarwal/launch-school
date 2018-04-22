def factors(number)
  dividend = number
  divisors = []
  while dividend > 0 do
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end

# while ... end is also a loop format,
# can be used as an alternative to loop do .. break end

p factors 1900  